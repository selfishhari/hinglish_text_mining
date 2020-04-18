#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 23 20:41:45 2020

@author: Narahari B M

Scrapes telegram chats and dumps it in database
"""

import os, sys
from pathlib import Path
from conf.local import credentials
from conf.public import catalog
from telethon import TelegramClient, sync
import pandas as pd, numpy as np
import sqlalchemy
import pymysql

pd.options.display.max_columns = 100

pd.options.display.max_rows = 100

pd.options.display.min_rows = 20


def safe_cast(val, default=np.nan):
    try:
        return int(val)
    except (ValueError, TypeError):
        return default


class TelegramDataExtracter():
    
    
    def __init__(self, messages_limit = 100):
        
        self.API_ID = credentials.API_ID
        
        self.API_HASH = credentials.API_HASH

        self.GROUP_NAME = credentials.GROUP_NAME
        
        self.MESSAGES_LIMIT = messages_limit
        
        self.MESSAGES_FILE = catalog.MESSAGES_FILE
        
        try :
            
            self.db_engine = sqlalchemy.create_engine(
            'mysql+pymysql://{0}:{1}@{2}/{3}?charset=utf8mb4'.format(credentials.DB_USERNAME,
                                             credentials.DB_PASSWORD,
                                             catalog.DB_HOST,
                                             catalog.DB_NAME))
        except Exception as e:
            print("cannot connect to database: ", e)
        
        self.msg_tablename = catalog.MSG_TABLENAME
        
        self.usr_tablename = catalog.USR_TABLENAME
        
        return
    
    async def initialize_client(self):
        
        """
        Initialized telethon client
        """
        
        self.client = TelegramClient('anon', self.API_ID, self.API_HASH)

        async with self.client:
            self.me = await self.client.get_me()
            
        #username = me.username
            
        print("printing me", self.me.stringify())
            
        print(self.me.phone)
            
        print("client initialized")
        
        return self.client
         
   
    def get_messages_df(self, messages):
    
        message_id  = []
    
        message = []
        
        sender = []
        
        reply_to = []
        
        time = []
        
        print(len(messages))
        
        if len(messages):
            
            for chat in messages:
                
                message_id.append(chat.id)
                
                message.append(chat.message)
                
                sender.append(chat.from_id)
                
                reply_to.append(chat.reply_to_msg_id)
                
                time.append(chat.date)
                
        messages_df = pd.DataFrame({'message_id':message_id, 
                                    'message': message, 
                                    'sender_id':sender, 
                                    'reply_to_msg_id':reply_to, 
                                    'time':time})
        
        return messages_df
    
    def get_users_df(self, users):
    
        user_id  = []
    
        phone = []
        
        scam = []
        
        verified = []
        
        firstname = []
        
        lastname = []
        
        username = []
        
        is_bot = []
        
        status = []
        
        print(len(users))
        
        if len(users):
            
            for user in users:
                
                user_id.append(user.id)
                
                phone.append(user.phone)
                
                scam.append(user.scam)
                
                verified.append(user.verified)
                
                firstname.append(user.first_name)
                
                lastname.append(user.last_name)
                
                username.append(user.username)
                
                is_bot.append(user.bot)
                
                try:
                    status.append(user.status.stringify())
                except Exception as e:
                    status.append(str(e))
                
        users_df = pd.DataFrame({'user_id':user_id, 
                                    'phone': phone, 
                                    'scam':scam, 
                                    'verified':verified, 
                                    'firstname':firstname,
                                    'lastname':lastname,
                                    'username':username,
                                    'is_bot':is_bot
                                    })
        
        return users_df
    
    def get_prev_index(self):
        """
        Reads users and messages db
        Returns max of sender_id and message_id for both the table
        """
        
        max_user_id = self.db_engine.execute("SELECT MAX({}) FROM {};".format(catalog.USR_ID_COL, catalog.USR_TABLENAME)).next()[0]
        
        max_message_id = self.db_engine.execute("SELECT MAX({}) FROM {};".format(catalog.MSG_ID_COL, catalog.MSG_TABLENAME)).next()[0]
        
        if max_message_id == None:
            max_message_id = 0
        
        if max_user_id == None:
            max_user_id = 0
        
        
        return max_user_id, max_message_id
    
    def process_usr_df(self):
        
        """
        Filters the new participant list for the ones already present in DB 
        and returns only new ones.
        Also returns list of old users that have left the group
        """
        
        sql = "SELECT * FROM {}".format(catalog.USR_TABLENAME)
        
        old_users_df = pd.read_sql_query(sql, self.db_engine)
        
        old_users = old_users_df[catalog.USR_ID_COL].unique().tolist()
        
        update_df = self.users_df.loc[~self.users_df[catalog.USR_ID_COL].isin(old_users), :]
        
        new_users = self.users_df[catalog.USR_ID_COL].unique().tolist()
        
        return update_df, list(set(old_users) - set(new_users))
    
    def process_msg_df(self):
        """
        Removes messages that are already present.
        """
        sql = "SELECT MAX({}) FROM {}".format(catalog.MSG_ID_COL, 
                                            catalog.MSG_TABLENAME)
        
        max_msg = pd.read_sql_query(sql, self.db_engine)
        
        print("max_message_id in db: ", max_msg)
        
        return self.messages_df
    
    def push_to_db(self):
        
        new_users_df, users_unavailable = self.process_usr_df()
        
        print(len(users_unavailable), " users have left totally")
        
        new_users_df.to_sql(catalog.USR_TABLENAME, con=self.db_engine, 
                            if_exists="append", index=False)
        
        print("Updated users database.")
        
        self.process_msg_df().to_sql(catalog.MSG_TABLENAME, con=self.db_engine, 
                            if_exists="append", index=False)
        
        print("Updated messages database.")
        
        return
    
    async def run_extraction_all(self):
        
        """
        Initializes telegram, extracts chats + users and updates DB.
        """
        
        max_user_id, max_message_id = self.get_prev_index()
        
        async with self.client:
            users = await self.client.get_participants(credentials.GROUP_NAME, limit = 50000000)
    
        self.users_df = self.get_users_df(users)
        
        async with self.client:
            messages = await self.client.get_messages(credentials.GROUP_NAME, limit = 50000000, min_id=max_message_id)

        
        self.messages_df = self.get_messages_df(messages)
        
        self.push_to_db()
            
        #messages_df.to_csv(self.MESSAGES_FILE, index=False)
        
        return self.messages_df, self.users_df
    
    
        
    
obj = TelegramDataExtracter()

await obj.initialize_client()

messages_df, users_df = await obj.run_extraction_all()

#users_df.to_csv(catalog.USERS_FILE, index=False)

#messages_df.to_csv(catalog.MESSAGES_FILE, index=False)

