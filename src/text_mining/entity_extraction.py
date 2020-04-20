#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 18 13:50:42 2020

@author: Narahari B M


Extraction of mobile brands and subbrands
"""
import pandas as pd, numpy as np, os, sys, re, collections, sqlalchemy, string
from importlib import reload

from conf.public import catalog
from conf.local import credentials

reload(catalog)
reload(credentials)

pd.options.display.max_columns = 100
pd.options.display.max_rows = 100
pd.options.display.min_rows = 50
pd.options.display.max_colwidth = 500


def _is_strict_alnum(x):
    
    if x.isdigit():
        return False
    
    o_len = len(x)
    
    remove_digits = str.maketrans('', '', string.digits)
    
    procx = x.translate(remove_digits)
    
    p_len = len(procx)
    
    return o_len > p_len

def _search_items(items_list, x, exact_search=True):
    
        """
        Returns matched items from items_list in a string x
        """
        
        x = str(x)
        
        items = []
        
        for item in items_list:
            
            x_list = x.split(" ")
            
            if (exact_search == True) | (len(item)<4):
                #force exact search in case item is only of 1/2 chars
            
                for w in x_list:
                    
                    if item == w.strip():
                        
                        items += [item]
                        
                        #break;
            else:
                
                if item in x:
                    
                    items += [item]
                    
        items = list(set(items)) #removing duplicates
        
        if "" in items:
            
            items.remove("")
            
            if items == None:
                items = []
            
        return items


class EntityExtractor():
    """
    Extracts mobile brand, model, issue, tools from the telegram text
    """
    
    def __init__(self, preproc_dict_files = True,
                 model_fnames = catalog.SCRAPED_MOB_MODEL_FILES,#single name/list of names
                 ):
        
        self.preproc_dict_files = preproc_dict_files
        
        self.model_fnames = model_fnames
        
        self.db_engine = sqlalchemy.create_engine(
            'mysql+pymysql://{0}:{1}@{2}/{3}?charset=utf8mb4'.format(credentials.DB_USERNAME,
                                             credentials.DB_PASSWORD,
                                             catalog.DB_HOST,
                                             catalog.DB_NAME))
        
        return
    
    def get_mob_models_ref(self, write_flag=True):
        """
        Reads from csvs, preprocs it if self.preproc_dict_files is true 
        returns cleaned mobile brands df
        """
        
        if not isinstance(self.model_fnames, collections.Iterable):
            
            self.model_fnames = [self.model_fnames]
        
        scraped_data_comb = pd.DataFrame(columns=[catalog.DEV_BRAND_COL, catalog.DEV_MODEL_COL])
    
        for fname in self.model_fnames:
            
            data = pd.read_csv(fname)
            
            scraped_data_comb = pd.concat([scraped_data_comb, data], axis=0, ignore_index=True)
             
        scraped_data_comb = scraped_data_comb.drop_duplicates()
        
        if self.preproc_dict_files:                 
            
            for x in scraped_data_comb.columns:
                
                scraped_data_comb[x] = scraped_data_comb[x].str.lower()
            
            scraped_data_comb[catalog.DEV_BRAND_COL] = scraped_data_comb[catalog.DEV_BRAND_COL].apply(lambda x: str(x).split("\n")[0])
            
            scraped_data_comb[catalog.DEV_MODEL_COL] = scraped_data_comb[catalog.DEV_MODEL_COL].apply(lambda x: re.sub("(\(.*\))", "", str(x)).strip()) #removing anything in brackets
            
            if write_flag:
                
                scraped_data_comb.to_csv(catalog.DEV_MODEL_UPD_FILE, index=False)
            
        print("Got device models data")
            
        return scraped_data_comb
    
    def get_issue_tools_ref(self):
        """
        Reads the issue-tools reference file, preprocs and returns df
        """
        
        df = pd.read_csv(catalog.ISSUES_SOLS_FILE)
        
        for x in df.columns:
            
            df[x] = df[x].str.lower().apply(lambda x: str(x).strip())
        
        print("got issue tools dict data")
        
        return df
        
    
    def get_messages_from_db(self):
        
        """
        Fetches raw telegram chat data from mysql db.
        Does basic cleaning
        """
    
        sql = "SELECT * FROM messages;"
        
        df = pd.read_sql_query(sql, self.db_engine)
        
        df[catalog.MSG_TEXT_COL] = df[catalog.MSG_TEXT_COL].str.lower()
        
        df[catalog.MSG_TEXT_COL] = df[catalog.MSG_TEXT_COL].apply(lambda x: str(x).replace("\n", " "))
        
        print("Got messages from database")
        
        return df
    
    
    def _search_entity(self, df, ent_df, colname, upd_colname):
        """
        Utility to dictionary extract items in a reference df
        """
    
        df = df.copy()
        
        all_ent_list = ent_df[colname].dropna().str.lower().unique().tolist()
        
        df[colname] = df[catalog.MSG_TEXT_COL].apply(lambda x: _search_items(all_ent_list, x))
        
        df[upd_colname+"_count"] = df[colname].apply(len)
        
        df.loc[df[upd_colname+"_count"] == 0, colname] = df.loc[df[upd_colname+"_count"] == 0, catalog.MSG_TEXT_COL].apply(lambda x: _search_items(all_ent_list, x, exact_search=False))
        
        df[upd_colname+"_count"] = df[colname].apply(len)
        
        df[colname] = df[colname].apply(lambda x: "|".join(x))
            
        return df
    
    
    @staticmethod
    def _search_models(items_list, x, rem_num_only=True):
        
        """
        As models can have bigram/trigrams cannot do exact matching.    
        """    
        x = str(x)
        
        #removing model names that have only numbers
        if rem_num_only:
            
            for item in items_list:
                
                if item.isdigit():
                    
                    items_list.remove(item)
        
        items = []
        
        x_list = x.split(" ")
        
        for item in items_list:
            
            if (len(item) < 2) | (not _is_strict_alnum(item)) | (len(item.split(" ")) < 2):
                # if the model is single char/ if it is not strictly alphanumeric
                #or when it is just  a single word
                #then do exact match
                
                for w in x_list:
                    
                    if w == item:
                        
                        items += [item]
                
            
            elif item in x:
                
                #if it is strictly alphanumeric, then check if it exists as a substring
                
                items += [item]
                
                #break;
        items = list(set(items)) #removing duplicates
        
        if "" in items:
            
            items.remove("")
            
            if items == None:
                items = []
     
        return items
            
            

    def get_brand_models(self):
        """
        Extracts brand names and models from text.
        It's a dictionary search for now
        """
        
        df = self.messages_df.copy()
        
        device_df = self.device_df.copy()
        
        msg_colname = catalog.MSG_TEXT_COL
        
        brand_colname = catalog.DEV_BRAND_COL
        
        model_colname = catalog.DEV_MODEL_COL
        
        all_brands = device_df[brand_colname].str.lower().unique().tolist()
        
        all_brands += ["moto"]
        
        all_sub_brands = device_df[model_colname].str.lower().unique().tolist()
        
        #all_sub_brands += ["iphone x", "j810g", "j610f", "j200g"]
        
        rem_list = ["flash", "phone", "connect", "link", "touch", "redmi", 
                    "mi", "status", "ram", "pro", "open", "find", "boot", 
                    "one", "click", "speed", "net", "track"]
        
        for x in rem_list:
            
            if x in all_sub_brands:
                
                all_sub_brands.remove(x)
        
        print("Extracting Brand Names")
        
        df[brand_colname] = df[msg_colname].apply(lambda x: _search_items(all_brands, x) )
        
        df["brand_count"] = df[brand_colname].apply(lambda x: len(x))
        
        df[brand_colname] = df[brand_colname].apply(lambda x: "|".join(x))
        
        print("Extracting Model Names")
        
        df[model_colname] = df[msg_colname].apply(lambda x: self._search_models(all_sub_brands, x) )
        
        df["models_count"] = df[model_colname].apply(lambda x: len(x))
        
        df[model_colname] = df[model_colname].apply(lambda x: "|".join(x))
        
        print("Brand and model name extraction complete")
        
        return df
    
    def get_issues_tools(self):
        """
        Extracts issues and tools
        """
        
        df = self.messages_df.copy()
        
        tools_ext_df = self._search_entity(df, self.issues_df, catalog.TOOLS_COL, catalog.TOOLS_UPD_COL)
        
        print("tools extraction complete")
        
        iss_tools_ext_df = self._search_entity(tools_ext_df, self.issues_df, catalog.ISSUE_COL, catalog.ISSUE_UPD_COL)
        
        print("issues extraction complete")
        
        
        return iss_tools_ext_df
    
    def run_extraction(self):
        """
        Runs extraction process from start to end
        """
        
        self.device_df = self.get_mob_models_ref()
        
        self.issues_df = self.get_issue_tools_ref()
        
        self.messages_df = self.get_messages_from_db()
        
        self.messages_df = self.get_brand_models()
        
        self.messages_df = self.get_issues_tools()
        
        return self.messages_df
    
    
"""
ent_ext_obj = EntityExtractor(model_fnames = [catalog.DEV_MODEL_UPD_FILE])

extracted_df = ent_ext_obj.run_extraction()


########################### CHECKING STATS #####################################


extracted_df.brand.value_counts(dropna=False)

extracted_df.brand_count.value_counts(dropna=False)

extracted_df.brand.nunique()

extracted_df.loc[extracted_df.brand_count==1, :].brand.nunique()

extracted_df.loc[extracted_df.brand_count==1, :].brand.value_counts()

extracted_df.loc[extracted_df.brand_count==2, :].brand.value_counts()


nobranddf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.brand_count==0), "message"]


noentdf = extracted_df.loc[(~pd.isnull(extracted_df.message)) &\
                             (extracted_df.brand_count==0) &\
                                 (extracted_df.models_count==0) &\
                                (extracted_df.issues_count==0) &\
                                    (extracted_df.tools_count==0), :]
noentdf.shape
#Out[11]: (11514, 13)

nobranddf.sample(5)




extracted_df.models.value_counts(dropna=False)

extracted_df.models_count.value_counts(dropna=False)

extracted_df.models.nunique()

extracted_df.loc[extracted_df.models_count==1, :].models.nunique()

extracted_df.loc[extracted_df.models_count==1, :].models.value_counts()

extracted_df.loc[extracted_df.models_count==2, :].models.value_counts()


nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.models_count==0), "message"]

nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & \
                                 (extracted_df.models_count!=0) &\
                                     (extracted_df.brand_count==0), ["message", catalog.DEV_BRAND_COL, catalog.DEV_MODEL_COL]]

nomodeldf.sample(5)


extracted_df.loc[extracted_df.brand=="vivo", "message"]

############################### ##############################################


################## Checking stats ##########################

extracted_df.issues.value_counts(dropna=False)

extracted_df.issues_count.value_counts(dropna=False)

extracted_df.issues.nunique()

extracted_df.loc[extracted_df.issues_count==1, :].issues.nunique()

extracted_df.loc[extracted_df.issues_count==1, :].issues.value_counts()

extracted_df.loc[extracted_df.issues_count==2, :].issues.value_counts()


nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.issues_count==0), "message"]

nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & \
                                 (extracted_df.issues_count==0) &\
                                     (extracted_df.brand_count==0), ["message", catalog.DEV_BRAND_COL, catalog.DEV_MODEL_COL]]

nomodeldf.sample(5)


extracted_df.loc[extracted_df.issues=="wifi", "message"]








extracted_df.tools.value_counts(dropna=False)

extracted_df.tools_count.value_counts(dropna=False)

extracted_df.tools.nunique()

extracted_df.loc[extracted_df.tools_count==1, :].tools.nunique()

extracted_df.loc[extracted_df.tools_count==1, :].tools.value_counts()

extracted_df.loc[extracted_df.tools_count==2, :].tools.value_counts()


nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.tools_count==0), "message"]

nomodeldf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & \
                                 (extracted_df.tools_count==0) &\
                                     (extracted_df.brand_count==0), ["message", catalog.DEV_BRAND_COL, catalog.DEV_MODEL_COL]]

nomodeldf.sample(5)


extracted_df.loc[extracted_df.tools=="umt", "message"]

"""
