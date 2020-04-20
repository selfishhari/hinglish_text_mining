#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 24 01:24:33 2020

@author: Narahari B M
"""

import os
########### FILES ############

MESSAGES_FILE = "data/01_raw/messages_dump.csv"

USERS_FILE = "data/01_raw/users_dump.csv"

MOBILE_MODEL_FILE = "data/01_raw/mobile_brands_list.xlsx"

SCRAPED_MOB_MODEL_FILES = ["data/02_processed/model_names.csv", 
                           "data/02_processed/model_names_v2.csv",
                           "data/02_processed/model_names_v3.csv",
                           #"data/02_processed/model_names_v5.csv",
                           ]

DEV_MODEL_UPD_FILE = os.path.join("data", "02_processed", "device_models_updated.csv")

ISSUES_SOLS_FILE = "data/01_raw/issues_tools.csv"

######## DATABASE CONFIGURATIONS #########

DB_HOST = 'localhost'

DB_NAME = "rmm_telegram"

USR_TABLENAME = 'users'

MSG_TABLENAME = 'messages'

USR_ID_COL = "user_id"

USR_PHN_COL = "phone"

MSG_ID_COL = "message_id"

MSG_TEXT_COL = "message"

MSG_TIME_COL = "time"

SENDER_ID_COL = "sender_id"

BRAND_UPD_COL = "brand"

MODELS_UPD_COL = "models"

ISSUE_UPD_COL = "issues"

TOOLS_UPD_COL = "tools"

############ External Data Configs #############

DEV_BRAND_COL = "brand"

DEV_MODEL_COL = "models"


#   issues_solutions.csv
ISSUE_COL = "issues"

TOOLS_COL = "tools"