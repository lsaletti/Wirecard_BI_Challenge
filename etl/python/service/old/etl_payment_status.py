#!/usr/bin/env python
# coding: utf-8

import psycopg2 
import pandas as pd



data_path = '/src/raw/'
save_data_path = '/src/processed/'
file_name = 'payment_status.csv'


def transform_data(data_path, save_data_path):
    df = pd.read_csv(data_path + file_name, sep=';')
    # df = df['acquirer_responses_id'].drop_duplicates(inplace=True)
    # print("---------------------------------")
    # print("salvando o arquivo processado acquirer_responses")
    df.to_csv(save_data_path + file_name, sep=';', index=False)
    
def insert_table():
    con = psycopg2.connect(host='128.0.0.2',port=5432, database='postgres', user='postgres', password='')
    cur = con.cursor()
    psql="""COPY wirecard.payment_status from '/src/processed/payment_status.csv' with delimiter ';' csv header encoding 'windows-1251'"""
    con.commit()
    print("---------------------------------")
    print("inserindo no banco de dados o arquivo:" + file_name)
    cur.execute(psql)

if __name__ == "__main__":
    transform_data(data_path, save_data_path)
    insert_table()