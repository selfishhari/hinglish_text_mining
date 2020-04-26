#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 15:04:39 2020

@author: Narahari B M

Handler to serve api requests
"""
from src.database.connector import DBConnect
from conf.public import catalog
import pandas as pd

db_engine = DBConnect().get_connection()

def fetch_data(options):
    
    sql = "SELECT * FROM {};".format(catalog.ENT_TABLENAME)
    
    return pd.read_sql_query(sql, db_engine)


def aggregate(options, df):
    """
    Subsets and Aggregates on the level specified in options
    """
    
    level1 = options["level1"].lower()
    
    level1_val = options["level1_val"].lower()
    
    level2 = options["level2"].lower()
    
    level2_val = options["level2_val"].lower()
    
    level3 = options["level3"].lower()
    
    if level1_val=="all":
        
        level1_df = df
        
    else:
        
        level1_df = df.loc[df[level1].str.contains(level1_val), :]
    
    if level2_val != "all":
        
        level2_df = level1_df.loc[level1_df[level2].str.contains(level2_val), :]
        
    else:
        #no need for any subesetting on level2
        level2_df = level1_df
        
    
    exp_df = _expand_df(level2_df, level3, catalog.ENTMAP_PROCID_COL)
    
    level2_df_exp = level2_df.merge(exp_df, on=catalog.ENTMAP_PROCID_COL, how="left")
    
    agg_df = level2_df_exp.groupby(level3 + "_expanded")[catalog.ENTMAP_PROCID_COL].nunique()
    
    agg_df = agg_df.reset_index(name = level3 + "_counts")
    
    agg_df.columns = ["labels", "data"]
    
    agg_df.dropna(inplace=True)
    
    agg_df = agg_df.loc[agg_df["labels"].str.strip() != "", :]
    
    agg_df.sort_values("data", inplace=True, ascending=False)
    
    if "clip_max_labels" in options.keys():
        
        clip_max_labels = str(options["clip_max_labels"])
    
    else:
        #no clipping
        clip_max_labels = ""
    
    if clip_max_labels.isdigit():
        #Clipping max labels
        
        clip_max_labels = int(clip_max_labels)
        
        if agg_df.shape[0] > clip_max_labels:
        
            clipped_df = agg_df.iloc[:clip_max_labels, :]
            
            other_label_df = agg_df.iloc[clip_max_labels:, :]
            
            other_label_val = other_label_df.loc[:, "data"].sum()
            
            row = pd.DataFrame({"labels":["others"], "data":[other_label_val]})
            
            agg_df = pd.concat([clipped_df, row], axis=0, ignore_index=True)
    
    return agg_df


def _expand_df(df, colname, index_colname):
    """
    Splits values on pipe operator and casts them to new row
    """
    
    new_df = pd.DataFrame(df[colname].str.split("|").tolist(), index=df[index_colname])
    
    new_df = new_df.stack().reset_index([0,index_colname])
    
    new_df.columns = [index_colname, colname + "_expanded"]
    
    return new_df

