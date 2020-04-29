#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 29 19:49:50 2020

@author: Narahari B M
"""

import time
import asyncio
from src.telegram.run_ingestion import TelegramDataExtracter
from src.text_mining.entity_extraction import EntityExtractor
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-i", "--interval", dest="interval",
                    help="how frequently in seconds should the extraction and analytics engine run?(seconds)", metavar="FILE")

ent_ext_obj = EntityExtractor()

async def runthis():
    date = time.strftime("%Y-%m-%d")
    obj = TelegramDataExtracter()
    await obj.initialize_client()
    await obj.run_extraction_all()
    ent_ext_obj.run_extraction(time_str=date)
    return
    

if __name__ == "__main__":
    
    args = parser.parse_args()
    
    print(args)
    
    while(1):
        print(time.strftime("%Y-%m-%d %H:%M:%S"))
        asyncio.get_event_loop().run_until_complete(runthis())        
        time.sleep(int(args.interval))