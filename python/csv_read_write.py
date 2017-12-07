# coding: UTF-8
import csv
import pandas as pd

csv_data  = pd.read_csv('org_list.csv')

data = csv_data[['タイトル', '初回放送', 'TID']]

#print (data)

data.to_csv("list.csv", index=False)

