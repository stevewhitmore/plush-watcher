"""Scans through shop page and records Plush toys that are not marked as sold out"""
import requests
import os
from bs4 import BeautifulSoup

SHOP_URL = os.environ.get('SHOP_URL')
html_text = requests.get(SHOP_URL).text
soup = BeautifulSoup(html_text, 'html.parser')

items = soup.find_all("div", class_="purchase-details__buttons")
match = []

for item in items:
    if "atc-btn-container disabled" not in str(item):
        print(item)
