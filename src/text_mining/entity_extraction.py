#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 18 13:50:42 2020

@author: Narahari B M


Extraction of mobile brands and subbrands
"""
import pandas as pd, numpy as np, os, sys, re, collections
import time, sqlalchemy, string
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
    
    Run run_extraction(time_str) method to run this class end to end
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
    
    def _preproc_message(self):
        """
        Removes links, blanks, None, lowercasing, replacinh newline chars.
        
        Groups consecutive messages by same user and reply messages.
        
        Creates mappings b/w original messageid and merged messages.
        
        Returns: tuple
            1. Preprocessed DF
            2. Mapping DF
        """
        df = self.raw_messages_df.copy()
        
        proc_m_id = self.proc_msg_id
        
        print("messages shape before preproc", df.shape)
        
        message_colname = catalog.MSG_TEXT_COL
        
        prev_row = None
        
        proc_df = pd.DataFrame(columns = [catalog.ENTMAP_PROCID_COL, catalog.MSG_TEXT_COL])
        
        #removing links
        df[message_colname] = df[message_colname].apply(lambda x: re.sub("(?P<url>https?://[^\s]+)",
                                             "", str(x)))
        
        df[message_colname] = df[message_colname].apply(lambda x: str(x).replace("None", ""))
        
        df[message_colname] = df[message_colname].str.strip()
        
        df[message_colname] = df[message_colname].str.lower()
        
        #removing blanks and nulls
        
        
        
        df = df.loc[(~(pd.isnull(df[message_colname]))) &\
               (~(df[message_colname]=="")), :].reset_index(drop=True)
            
        #replace backslashes with space
        df[message_colname] = df[message_colname].apply(lambda x: str(x).replace("\n", " "))
            
        translator = str.maketrans(string.punctuation, ' '*len(string.punctuation))
        
        df[message_colname] = df[message_colname].apply(lambda x: str(x).translate(translator))
        
        #remove extra spaces
        df[message_colname] = df[message_colname].apply(lambda x: " ".join(str(x).split()))
            
        print("messages shape after basic preproc", df.shape, "Combining chats now..")
        
        map_proc_m_id = []
        
        map_m_id = []
        
        num_rows = df.shape[0]
        
        df = df.reset_index(drop=True)
        
        for num, row in df.iterrows():        
            
            if num == 0:
                
                prev_row = row
                
                map_proc_m_id += [proc_m_id]
            
                map_m_id += [row[catalog.MSG_ID_COL]]
                
                continue
            
            curr_sender_id = row[catalog.SENDER_ID_COL]
            
            prev_sender_id = prev_row[catalog.SENDER_ID_COL]
            
            if prev_sender_id == curr_sender_id:
                
                row[message_colname] = prev_row[message_colname] + " " + row[message_colname]
                
                    
            else:
                
                curr_df = pd.DataFrame({catalog.ENTMAP_PROCID_COL:[proc_m_id],
                              catalog.MSG_TEXT_COL:[prev_row[message_colname]]
                              })
                
                proc_df = pd.concat([proc_df, curr_df], axis=0, ignore_index=True)
                
                proc_m_id += 1
                
            
            prev_row = row
            
            map_proc_m_id += [proc_m_id]
            
            map_m_id += [row[catalog.MSG_ID_COL]]
            
        #compulsorily write the last row            
        curr_df = pd.DataFrame({catalog.ENTMAP_PROCID_COL:[proc_m_id],
                                  catalog.MSG_TEXT_COL:[row[message_colname]]
                                  })
                    
        proc_df = pd.concat([proc_df, curr_df], axis=0, ignore_index=True)
            
        mapping_df = pd.DataFrame({catalog.ENTMAP_PROCID_COL:map_proc_m_id,
                      catalog.MSG_ID_COL:map_m_id
                      })
        
        print("Preproc Complete: messages shape after merging preproc", proc_df.shape)
                
        return proc_df, mapping_df
    
    
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
            
        print("Got device models ref data")
            
        return scraped_data_comb
    
    def get_issue_tools_ref(self):
        """
        Reads the issue-tools reference file, preprocs and returns df
        """
        
        df = pd.read_csv(catalog.ISSUES_SOLS_FILE)
        
        for x in df.columns:
            
            df[x] = df[x].str.lower().apply(lambda x: str(x).strip())
        
        print("Got issue tools ref data")
        
        return df
    
    def _get_first_msg_id(self, time_str):
        """
        Returns id of first message given at given timestamp.
        Considers grouped messages and returns min message id for the corresponding group
        """
        sql = "SELECT min({}) FROM messages WHERE time > '{}'".format(catalog.MSG_ID_COL, time_str)
        
        raw_msg_id = next(self.db_engine.execute(sql))[0]
        
        if raw_msg_id == None:
            
            print("No messages available for given timestamp. Returning the latest id")
            
            sql = "SELECT max({}) FROM {};".format(catalog.MSG_ID_COL, catalog.MSG_TABLENAME)
            
            raw_msg_id = next(self.db_engine.execute(sql))[0]
            
        sql = "SELECT min({}) FROM {} WHERE {} >= {};".format(catalog.ENTMAP_PROCID_COL, catalog.ENTMAP_TABLENAME,
                                                             catalog.MSG_ID_COL, raw_msg_id)
        
        #print(sql)
        
        proc_msg_id = next(self.db_engine.execute(sql))[0]
        
        if proc_msg_id == None:
            
            print("looks like text hasn't been processed for the date given. Hence returning the latest processed text id")
            
            sql = "SELECT max({}) FROM {};".format(catalog.ENTMAP_PROCID_COL, catalog.ENTMAP_TABLENAME,
                                                             catalog.MSG_ID_COL, raw_msg_id)
            
            proc_msg_id = next(self.db_engine.execute(sql))[0]
            
            if proc_msg_id == None:
                
                sql = "SELECT min({}) FROM {};".format(catalog.MSG_ID_COL, catalog.MSG_TABLENAME)
                
                final_msg_id = next(self.db_engine.execute(sql))[0]
                
                if final_msg_id == None:
                    
                    print("Looks like there are no messages in the DB. Returning 1")
                    
                    final_msg_id = 1
                    
                print("**\nlooks like no text has been processed yet.\
                      \nHence will be returning first message id.\
                      \nThis might result in computing extraction for entire text data available in the db.\n**")
                
                proc_msg_id = 1
                
                return final_msg_id, proc_msg_id
        
        sql = "SELECT min({}) FROM {} WHERE {} = {};".format(catalog.MSG_ID_COL, catalog.ENTMAP_TABLENAME,
                                                             catalog.ENTMAP_PROCID_COL, proc_msg_id)
        
        final_msg_id = next(self.db_engine.execute(sql))[0]        
        
        return final_msg_id, proc_msg_id
        
        
    
    def get_messages_from_db(self, time_str="2019-11-21"):
        
        """
        Fetches raw telegram chat data from mysql db, table-messages.        
        
        parameters:
            time_str: 
                A timestamp string of format 2020-04-21(or 2020-04-21 01:59:14). 
                
                Returns all messages that came in after this timestamp in telegram.
                
                Defaults to 2019-11-21
        returns:
            A pandas dataframe
        """
    
        #sql = "SELECT * FROM {};".format(catalog.MSG_TABLENAME)
        
        self.msg_id, self.proc_msg_id = self._get_first_msg_id(time_str)
        
        sql = "SELECT * FROM {} WHERE {} >= {}".format( catalog.MSG_TABLENAME,
                                                      catalog.MSG_ID_COL, self.msg_id)
        
        df = pd.read_sql_query(sql, self.db_engine)
        
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
    
    @staticmethod
    def _get_issue_groups(df, issues_df):
        """
        Groups issues based on the issue group in issues_df.
        """
        
        replace_dict = {}
        
        #Creating a dictionary to replace text.
        
        for x in issues_df.to_dict(orient="records"):
            
            replace_dict[ x[catalog.ISSUE_COL] ] = x[catalog.ISSUE_GRP_COL]
            
        #print(replace_dict)
            
        df[catalog.ISSUE_GRP_UPD_COL] = df[catalog.ISSUE_UPD_COL].apply(lambda x: "|".join(set(
            [replace_dict[y] if y in replace_dict.keys() \
             else y \
                 for y in x.split("|")])))
            
        print("grouping issues complete..")
        
        return df
    
    def get_issues_tools(self):
        """
        Extracts issues and tools
        """
        
        df = self.messages_df.copy()
        
        tools_ext_df = self._search_entity(df, self.issues_df, catalog.TOOLS_COL, catalog.TOOLS_UPD_COL)
        
        print("tools extraction complete")
        
        iss_tools_ext_df = self._search_entity(tools_ext_df, self.issues_df, catalog.ISSUE_COL, catalog.ISSUE_UPD_COL)
        
        iss_tools_ext_df = self._get_issue_groups(iss_tools_ext_df, self.issues_df)
        
        print("issues extraction complete")
        
        
        return iss_tools_ext_df
    
    def update_entity_table(self, df):
        """
        Inserts/Updates entity table based on the keys present
        """
        
        print("Updating entity table..")
        
        sql = "SELECT {} FROM {};".format(catalog.ENTMAP_PROCID_COL, catalog.ENT_TABLENAME)
        
        proc_msg_ids = pd.read_sql_query(sql, self.db_engine)[catalog.ENTMAP_PROCID_COL].tolist()
        
        df_append = df.loc[~(df[catalog.ENTMAP_PROCID_COL].isin(proc_msg_ids)), :]
        
        df_insert = df.loc[df[catalog.ENTMAP_PROCID_COL].isin(proc_msg_ids), :]
        
        df_append.to_sql(catalog.ENT_TABLENAME, con=self.db_engine, 
                            if_exists="append", index=False)
        
        print("appending to {} table complete".format(catalog.ENT_TABLENAME), "{} new rows added".format(df_append.shape))
        
        #Creating a temporary table
        df_insert.to_sql('temp_table', self.db_engine, if_exists='replace', index=False)
        
        set_query = "SET "
        
        for i in range(len(df_insert.columns)):
            
            colname = df_insert.columns[i]
            
            if colname==catalog.ENTMAP_PROCID_COL:
                continue;
            
            set_query += "f.{} =t.{}".format(colname, colname)
            
            if i != (len(df_insert.columns)-1):
                
                set_query += ","

        sql = """
        UPDATE {}  AS f INNER JOIN temp_table as t on f.{} = t.{} {};
        """.format(catalog.ENT_TABLENAME, catalog.ENTMAP_PROCID_COL, 
        catalog.ENTMAP_PROCID_COL,set_query)
        
        print("Updated table: {} entries".format(df_insert.shape))
        
        sql = "DROP TABLE temp_table;"
        
        self.db_engine.execute(sql)
        
        return
    
    def update_entitykey_table(self, df):
        """
        Deletes and updates entitykey table based on the keys present
        """
        
        print("Updating entity table..")
        
        sql = "SELECT {} FROM {};".format(catalog.ENTMAP_PROCID_COL, catalog.ENTMAP_TABLENAME)
        
        proc_msg_ids = pd.read_sql_query(sql, self.db_engine)[catalog.ENTMAP_PROCID_COL].tolist()
        
        #df_append = df.loc[~(df[catalog.ENTMAP_PROCID_COL].isin(proc_msg_ids)), :]
        
        df_delete = df.loc[df[catalog.ENTMAP_PROCID_COL].isin(proc_msg_ids), :]
        
        delete_ids = tuple(df_delete[catalog.ENTMAP_PROCID_COL].unique().tolist())
        
        if len(delete_ids) > 1:
            
            sql = "DELETE FROM {} WHERE {} IN {};".format(catalog.ENTMAP_TABLENAME, catalog.ENTMAP_PROCID_COL, delete_ids)
        
            #print(sql)
                        
            self.db_engine.execute(sql)
            
        elif len(delete_ids) == 1:
            
            sql = "DELETE FROM {} WHERE {} IN ({});".format(catalog.ENTMAP_TABLENAME, catalog.ENTMAP_PROCID_COL, delete_ids[0])
        
            #print(sql)
                        
            self.db_engine.execute(sql)
            
            
        print("Deleted existing {} records from {}".format(df_delete.shape[0], catalog.ENTMAP_TABLENAME))
            
            
        
        df.to_sql(catalog.ENTMAP_TABLENAME, con=self.db_engine, 
                            if_exists="append", index=False)
        
        print("appending to {} table complete".format(catalog.ENTMAP_TABLENAME), "{} new rows added".format(df.shape))
        
        return
    
    
    
    def run_extraction(self, time_str="2019-11-21", update_db=True):
        """
        Runs extraction process from start to end
        
        This involves:
            1. Read reference data of device-model info, issue-tools info
            2. Fetch raw messages from database post the given time stamp
            3. Preprocess text
            4. Extract brand, models, issues and tools from the processed text
            5. Updates database tables with extracted info
        
        parameters:
            time_str: str. 
                Timestamp string. default: "2019-11-21".                
                Format can also be "2020-04-21 01:59:14").    
                Run extraction for messages recieved after this timestamp
            update_db: boolean
                If true(default) updates entity and entitykey tables
                
        returns:
            DataFrame with all extracted entities.
        """
        
        self.device_df = self.get_mob_models_ref()
        
        self.issues_df = self.get_issue_tools_ref()
        
        self.raw_messages_df = self.get_messages_from_db(time_str=time_str)
        
        self.messages_df, self.mapping_df = self._preproc_message()
        
        self.messages_df = self.get_brand_models()
        
        self.messages_df = self.get_issues_tools()
        
        if update_db:
                
            self.update_entity_table(self.messages_df)
            
            self.update_entitykey_table(self.mapping_df)
        
        print("Extraction complete")
        
        return self.messages_df


"""
ent_ext_obj = EntityExtractor(model_fnames = [catalog.DEV_MODEL_UPD_FILE])

extracted_df = ent_ext_obj.run_extraction(time_str="2020-04-01")


########################### CHECKING STATS #####################################


extracted_df.brand.value_counts(dropna=False)

extracted_df.brand_count.value_counts(dropna=False)

extracted_df.brand.nunique()

extracted_df.loc[extracted_df.brand_count==1, :].brand.nunique()

extracted_df.loc[extracted_df.brand_count==1, :].brand.value_counts()

extracted_df.loc[extracted_df.brand_count==2, :].brand.value_counts()


nobranddf = extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.brand_count==0), "message"]


noentdf = extracted_df.loc[(extracted_df.message!="None") &\
    (~pd.isnull(extracted_df.message)) &\
                             (extracted_df.brand_count==0) &\
                                 (extracted_df.models_count==0) &\
                                (extracted_df.issues_count==0) &\
                                    (extracted_df.tools_count==0), :]
noentdf.shape
#Out[11]: (11514, 13)

nobranddf.sample(5)




extracted_df.models.value_counts(dropna=False)

extracted_df.models_count.value_counts(dropna=False)

extracted_df.loc[extracted_df.brand=="samsung", :].models.value_counts(dropna=False)

extracted_df.loc[(extracted_df.brand=="samsung") &\
(extracted_df.model_count==0), :].message.sample(5)
    

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

extracted_df.loc[(~pd.isnull(extracted_df.message)) & (extracted_df.brand=="redmi"), :].issues.value_counts()


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


extracted_df.loc[extracted_df.brand=="mi|redmi", "message"]


extracted_df.loc[(~pd.isnull(extracted_df.message)) &\
                             (extracted_df.brand=="vivo") &\
                                 (extracted_df.models==""), :].message#.value_counts()
"""
