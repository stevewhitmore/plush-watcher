"""Scans through shop page and records Plush toys that are not marked as sold out"""
import requests
from bs4 import BeautifulSoup

SHOP_URL = 'https://www.shopwarriorcats.com/collections/plushes-homeware'
html_text = requests.get(SHOP_URL).text
soup = BeautifulSoup(html_text, 'html.parser')

items = soup.find_all("div", class_="info")
match = []

for item in items:
    if "Plush" in str(item):
        if "Sold Out" not in str(item):
            match.append(str(item))


if len(match) > 0:
    print(match)
