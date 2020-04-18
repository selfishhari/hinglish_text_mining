#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 24 01:24:33 2020

@author: Narahari B M
"""


########### CSVs ############

MESSAGES_FILE = "data/01_raw/messages_dump.csv"

USERS_FILE = "data/01_raw/users_dump.csv"


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