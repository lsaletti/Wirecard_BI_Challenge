import psycopg2
import pandas as pd
import sys
import json


from flask import Flask,jsonify, Response
app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

def tpv():
    con = psycopg2.connect(host='128.0.0.2',port=5432, database='postgres', user='postgres', password='')
    cur = con.cursor()
    psql="""select * from wirecard.tpv"""
    cur.execute(psql)
    result = cur.fetchall()
    list_results = []
    for row in result:
        dic = { "TPV":row[0],
                "TPV_COUNT":row[1]
                }
        list_results.append(dic)
    return list_results

def overall_conversion_rate():
    con = psycopg2.connect(host='128.0.0.2',port=5432, database='postgres', user='postgres', password='')
    cur = con.cursor()
    psql="""select * from  wirecard.overall_conversion_rate"""
    cur.execute(psql)
    result = cur.fetchall()
    list_results = []
    for row in result:
        dic = { "OVERALL_CONVERSION_RATE":row[0]
                }
        list_results.append(dic)
    return list_results

def acquirer_efficiency():
    con = psycopg2.connect(host='128.0.0.2',port=5432, database='postgres', user='postgres', password='')
    cur = con.cursor()
    psql="""select * from wirecard.acquirer_efficiency"""
    cur.execute(psql)
    result = cur.fetchall()
    list_results = []
    for row in result:
        dic = { "ACQUIRER":row[0],
                "PAYMENT_VALUE_TOTAL":row[1],
                "PAYMENT_FEE_TOTAL":row[2],
                "AMOUNT":row[3],
                }
        list_results.append(dic)
    return list_results
    
@app.route('/',methods=['GET'])
def helloIndex():
    return 'API Desafio Wirecard'

@app.route('/tpv/wirecard.com',methods=['GET', 'POST'])
def list_tpv():
    wierecard = tpv()
    return Response(json.dumps(wierecard), status=200)

@app.route('/overall_conversion_rate/wirecard.com',methods=['GET', 'POST'])
def list_overall_conversion_rate():
    wierecard = overall_conversion_rate()
    return Response(json.dumps(wierecard), status=200)

@app.route('/acquirer_efficiency/wirecard.com',methods=['GET', 'POST'])
def list_acquirer_efficiency():
    wirecard = acquirer_efficiency()
    return Response(json.dumps(wirecard), status=200)

if __name__ == '__main__':  
    app.run(host='wirecard-api', port='5003', debug=True)
