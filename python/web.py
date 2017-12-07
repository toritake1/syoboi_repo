# coding: UTF-8
import csv
#import urllib2
from urllib.request import urlopen
from bs4 import BeautifulSoup

# アクセスするURL
#url = "http://cal.syoboi.jp/list?cat=10"
url = "http://cal.syoboi.jp/list?cat=1"

# URLにアクセスする htmlが帰ってくる 
html = urlopen(url)

# htmlをBeautifulSoupで扱う
soup = BeautifulSoup(html, "html.parser")

#テーブルを指定
table = soup.findAll("table",{"class":"TitleList TableColor"})[0]
rows = table.findAll("tr")

csvFile = open("now_org_list.csv", 'wt', newline = '', encoding = 'utf-8')
writer = csv.writer(csvFile)

try:
    for row in rows:
        csvRow = []
        for cell in row.findAll(['td', 'th']):
            csvRow.append(cell.get_text())
        writer.writerow(csvRow)
finally:
    csvFile.close()
