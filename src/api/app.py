#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 14:23:03 2020

@author: Narahari B M
"""

import sys, os
sys.path.insert(0, "/home/fractaluser/Narahari/Personal/Consulting/hinglish_text_mining")

from flask import Flask, request
from flask_cors import CORS
from importlib import reload
import src.api.api_handler as api_handler
import jsondata


app = Flask(__name__)
CORS(app)

sample_options = {'level1': 'brand', 'level1_val': 'mi', 'level2': 'models', 'level2_val': 'all', 'level3': 'issues', 'clip_max_labels': 15}

@app.route('/aggregates', methods=['POST'])
def aggregate_handler():
    
    if request.method == "POST":
        
        data_recieved = request.get_json()
        
        print(data_recieved)
        
        response = api_handler.serve_aggregation(data_recieved)
        
    return response
	
@app.route('/labels')
def get_all_labels():
    
    response = api_handler.serve_labels()
    
    return response


@app.route('/timeseries', methods=['POST', 'GET'])
def timeseries_handler():
    
    data_recieved = request.get_json()
    
    print(data_recieved)
    
    response = api_handler.serve_timeseries(data_recieved)
        
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0')