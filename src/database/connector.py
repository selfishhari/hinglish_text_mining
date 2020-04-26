#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 14:52:12 2020

@author: Narahari B M
"""


import sqlalchemy, pymysql
from conf.public import catalog
from conf.local import credentials


class DBConnect():
    def __init__(self):
        
        self.db_engine = sqlalchemy.create_engine(
            'mysql+pymysql://{0}:{1}@{2}/{3}?charset=utf8mb4'.format(credentials.DB_USERNAME,
                                             credentials.DB_PASSWORD,
                                             catalog.DB_HOST,
                                             catalog.DB_NAME))
        
    def get_connection(self):
        
        return self.db_engine