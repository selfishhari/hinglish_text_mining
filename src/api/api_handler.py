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
import json, copy

def fetch_data():
    
    db_engine = DBConnect().get_connection()
    
    sql = "SELECT * FROM {};".format(catalog.ENT_TABLENAME)
    
    return pd.read_sql_query(sql, db_engine)

def fetch_ts_data():
    
    db_engine = DBConnect().get_connection()
    
    sql = "SELECT {}, {} FROM {};".format(catalog.MSG_ID_COL, catalog.MSG_TIME_COL, 
                                          catalog.MSG_TABLENAME)
    
    time_df = pd.read_sql_query(sql, db_engine)
    
    sql = "SELECT * FROM {};".format(catalog.ENTMAP_TABLENAME)
    
    map_df = pd.read_sql_query(sql, db_engine)
    
    map_df = map_df.merge(time_df, on=catalog.MSG_ID_COL, how="left")
    
    return map_df


def aggregate(options, df):
    """
    Subsets and Aggregates on the level specified in options
    """
    
    level1 = options["level1"].lower()
    
    level1_val = options["level1_val"].lower()
    
    level2 = options["level2"].lower()
    
    level2_val = options["level2_val"].lower()
    
    level3 = options["level3"].lower()
    
    if level1=="issues":
        level1 = "issues_group"
    elif level2=="issues":
        level2 = "issues_group"
    elif level3=="issues":
        level3 = "issues_group"
    
    if level1_val=="all":
        
        level1_df = df
        
    else:
        
        level1_df = df.loc[df[level1].str.contains(level1_val), :]
    
    if level2_val != "all":
        
        level2_df = level1_df.loc[level1_df[level2].str.contains(level2_val), :]
        
    else:
        #no need for any subesetting on level2
        level2_df = level1_df
        
    if level2_df.shape[0] < 1:
        
        return pd.DataFrame(columns=["labels", "data"])
    
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
            
    agg_df["data"] = round(agg_df["data"] / agg_df["data"].sum() * 100, 1)
    
    return agg_df


def _expand_df(df, colname, index_colname):
    """
    Splits values on pipe operator and casts them to new row
    """
    
    new_df = pd.DataFrame(df[colname].str.split("|").tolist(), index=df[index_colname])
    
    new_df = new_df.stack().reset_index([0,index_colname])
    
    new_df.columns = [index_colname, colname + "_expanded"]
    
    return new_df

def serve_aggregation(options):
    
    df = fetch_data()
    
    response_df = aggregate(options, df)
    
    return response_df.to_dict(orient="list")


def _get_kvp(df, k_col, v_col, keys_list=None):
    
    if keys_list == None:
        
        keys_list = df[k_col].unique()
        
    
    kvp = {}
    
    for key in keys_list:
        
        kvp[key] = df.loc[df[k_col] == key, v_col].unique().tolist()
        
        kvp[key] = ["all"] + kvp[key]
    
    return kvp

def serve_labels():
    
    df = fetch_data()
    
    brand_exp = _expand_df(df, catalog.BRAND_UPD_COL, catalog.ENTMAP_PROCID_COL)
    
    brand_unique = brand_exp[catalog.BRAND_UPD_COL + "_expanded"].unique().tolist()
    
    if "" in brand_unique:
        brand_unique.remove("")
    
    models_exp = _expand_df(df, catalog.MODELS_UPD_COL, catalog.ENTMAP_PROCID_COL)
    
    df_mod_exp = df.merge(models_exp, on=catalog.ENTMAP_PROCID_COL, how="left")
    
    df_mod_exp = df_mod_exp.merge(brand_exp, on=catalog.ENTMAP_PROCID_COL, how="left")
    
    df_mod_exp_grp = df_mod_exp.groupby([catalog.BRAND_UPD_COL, catalog.MODELS_UPD_COL + "_expanded"])[catalog.ENTMAP_PROCID_COL].nunique().reset_index()
    
    df_mod_exp_grp = df_mod_exp_grp.dropna()
    
    df_mod_exp_grp = df_mod_exp_grp.loc[df_mod_exp_grp[catalog.BRAND_UPD_COL].str.strip() != "", :]
    
    df_mod_exp_grp = df_mod_exp_grp.loc[df_mod_exp_grp[catalog.MODELS_UPD_COL + "_expanded"].str.strip() != "", :]
    
    df_mod_exp_grp.sort_values([catalog.BRAND_UPD_COL, catalog.ENTMAP_PROCID_COL], ascending=False, inplace=True)
    
    models_unique = _get_kvp(df_mod_exp_grp, catalog.BRAND_UPD_COL, catalog.MODELS_UPD_COL + "_expanded", keys_list=copy.deepcopy(brand_unique))
    
    issues_exp = _expand_df(df, catalog.ISSUE_GRP_UPD_COL, catalog.ENTMAP_PROCID_COL)
    
    issues_unique = issues_exp[catalog.ISSUE_GRP_UPD_COL+"_expanded"].unique().tolist()
    
    tools_exp = _expand_df(df, catalog.TOOLS_UPD_COL, catalog.ENTMAP_PROCID_COL)
    
    tools_unique = tools_exp[catalog.TOOLS_UPD_COL + "_expanded"].unique().tolist()
    
    if "" in issues_unique:
        issues_unique.remove("")
        
    if "" in tools_unique:
        tools_unique.remove("")
    
    return {
        "brand":["all"] + brand_unique,
        "models":models_unique,
        "issues":["all"] + issues_unique,
        "tools":["all"] + tools_unique
        }

def generate_timeseries():
    
    time_df = fetch_ts_data()
    
    time_df["year_month_num"] = time_df[catalog.MSG_TIME_COL].dt.strftime("%Y_%W")
    
    time_df["year_month"] = time_df[catalog.MSG_TIME_COL].dt.strftime("%Y_%W")
    
    ts_df = time_df.groupby(["year_month_num", "year_month"])[catalog.MSG_ID_COL].nunique().reset_index()
    
    ts_df.sort_values("year_month_num", inplace=True)
    
    del ts_df["year_month_num"]
    
    ts_df.columns = ["labels", "data"]
        
    return ts_df

def serve_timeseries(options=None):
    
    df = generate_timeseries()
    
    return df.to_dict(orient="list")