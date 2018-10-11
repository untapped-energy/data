import requests
from bs4 import BeautifulSoup
import re
from datetime import datetime
import time
from fake_useragent import UserAgent
import csv
from random import randint
from urllib.request import urlopen
from urllib.parse import urlparse
from pathlib import Path
import os
import pickle
import os.path
import base64
import string

FILE_LOCATION = "C:\\tmp"

ROOT_PATH = 'https://apps.neb-one.gc.ca'


def format_filename(s):
    """Take a string and return a valid filename constructed from the string.
Uses a whitelist approach: any characters not present in valid_chars are
removed. Also spaces are replaced with underscores.

Note: this method may produce invalid filenames such as ``, `.` or `..`
When I use this method I prepend a date string like '2009_01_15_19_46_32_'
and append a file extension like '.txt', so I avoid the potential of using
an invalid filename.

"""
    valid_chars = "-_() %s%s" % (string.ascii_letters, string.digits)
    filename = ''.join(c for c in s if c in valid_chars)
    filename = filename.replace(' ', '_')  # I don't like spaces in filenames.
    return filename


urls = {
'Enbridge Northern Gateway': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/625023',
'Nova Gas Transmission Ltd. Leismer to Kettle River Crossover': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/747755',
'Nova Gas Transmission Ltd. Northwest Mainline Komie North Extension': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/784970',
'Enbridge Edmonton to Hardisty Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/949247',
'Nova Gas Transmission Ltd. North Montney Mainline Project (Aitken and Kahta Sections)': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2452373',
'Nova Gas Transmission Ltd. ATCO Integration Asset Transfer (Application for Integration Asset Transfer )': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2421410',
'Trans Mountain Pipeline ULC - Trans Mountain Expansion Project (TMX)': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2450810',
'Nova Gas Transmission Ltd. Wolverine River Lateral Loop (Carmon Creek Section)': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2484455',
'Energy East Pipeline Ltd. - Energy East-Eastern Mainline (2016)': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2997454',
'Enbridge Line 3 Replacement Program Application': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2776667',
'Nova Gas Transmission Ltd. 2017 System Expansion Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2787123',
'Nova Gas Transmission Ltd. Towerbirch Expansion': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2902636',
'Nova Gas Transmission Ltd. Albersun Purchase': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3065183',
'ITC Lake Erie Connector LLC - s. 58 Application for the Lake Erie Connector Project Certificate': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2855963',
'Manitoba Hydro – Manitoba to Minnesota IPL': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3478199',
'Enbridge Line 9 Reversal Phase 1 Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/770259',
'Enbridge Line 9B Reversal Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/958044',
'TransCanada s. 58 Application for the King North Connection Pipeline Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2585045',
'TCPL Vaughan Mainline Expansion': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2926774',
'Enbridge Line 10 Westover Segment Replacement Project Application': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/2937936',
'Westcoast Energy Inc. - Wyndwood Pipeline Expansion': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3173351',
'Enbridge Line 21 HDD Replacement': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3270167',
'Nova Gas Transmission Ltd. Sundre Crossover': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3339124',
'Westcoast Energy Inc. - Spruce Ridge Program': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3478404',
'Trans Mountain Pipeline ULC - Westridge Delivery Line Relocation': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3563432',
'Nova Gas Transmission Ltd. West Path Delivery Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/3575877',
'Alliance Pipeline Ltd. - British Columbia Expansion': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/461416',
'Westcoast Energy Inc - - South Peace Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/502116',
'Emera Brunswick Pipeline Company - Application for Alternative Technique to HDD for Crossing St John River': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/502978',
'Westcoast Energy Inc - Application for the Fort Nelson North Processing Facility': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/592484',
'TransCanada Keystone XL': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/556602',
'Nova Gas Transmission Ltd. Groundbirch Pipeline Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/560081',
'Dawn Gateway Pipeline General Partner Inc - Dawn Gateway Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/579919',
'Westcoast Energy Inc - Dawson Gas Plant': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/628115',
'Nova Gas Transmission Ltd. Horn River Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/614181',
'Imperial et. al - Imperial Mackenzie Gas Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/343167',
'Provident - Beatton River Replacement': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/675024',
'Enbridge Bakken Pipeline Expansion Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/675359',
'Vantage Pipeline Canada Inc. - Vantage Pipeline Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/680146',
'Nova Gas Transmission Ltd. NW Mainline Expansion': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/692433',
'Emera Brunswick Pipeline Company - Brunswick Pipeline Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/414083',
'Enbridge Line 4 Extension Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/469099',
'Enbridge Southern Lights GP Inc. - Line 13 Transfer, Line 13 Reversal and Capacity Replacement for the Southern Lights Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/459770',
'TransCanada Keystone GP Ltd. - TransCanada Keystone Pipeline Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/445961',
'EnCana Deep Panuke Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/441593',
'Enbridge Pipelines (Westspur) Inc. - Alida Cromer Capacity Expansion (ACCE) Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/452158',
'Terasen Pipelines (TransMountain) Inc. - TMX Anchor Loop Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/407555',
'SemCAMS Redwillow ULC - Redwillow Pipeline': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/496625',
'Nova Gas Transmission Ltd. - TransCanada Alberta System': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/524290',
'Enbridge Pipelines Inc. - Alberta Clipper Expansion Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/465181',
'Enbridge Pipelines Inc.- Line 4 Extension Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/469099',
}


# test_urls = {
# 'Enbridge Pipelines Inc. - Alberta Clipper Expansion Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/465181',
# 'Enbridge Pipelines Inc.- Line 4 Extension Project': 'https://apps.neb-one.gc.ca/REGDOCS/Item/View/469099',
# }


# To generate random user agent
ua = UserAgent()
session = requests.Session()


def extract_links(_urls, all_urls, download_urls):
    print('.', end='')
    new_urls = []
    for _url in _urls:
        if re.match(r".*View.*", _url):
            _url = _url.replace('/View/', '/LoadResult/')
            res = session.request('GET', _url, verify=False, headers=headers_dict)
            ner_page = BeautifulSoup(res.text, "lxml")

            download_tags = ner_page.find_all('a', {'href': re.compile(r'/Download/\d')})
            for download_tag in download_tags:
                download_urls.append(ROOT_PATH + download_tag['href'])

            link_tags = ner_page.find_all('a', {'class': 'no-expand', 'href': re.compile(r'/View/\d')})
            for link_tag in link_tags:
                new_urls.append(ROOT_PATH + link_tag['href'])
            if len(new_urls) > 0:
                all_urls += new_urls
                extract_links(new_urls, all_urls, download_urls)



with open('ner_errors.csv', 'w', encoding='utf8') as errorfile:
    err_field_names = ['error']
    err_doc_writer = csv.DictWriter(errorfile, fieldnames=err_field_names, quotechar = '"', doublequote = True, skipinitialspace=True, lineterminator='\n')
    err_doc_writer.writeheader()

    # resources = []
    # pages = []

    # company = k
    headers_dict = {'User-Agent': ua.random}

    # First Page (one containing list of pages)
    # url = f"http://www.actims.ca/news/{v}"

    project_data = {}

    if not os.path.exists(("project_data.p")):
        for idx, (name, url) in enumerate(urls.items()):
            download_urls = []
            all_urls = []
            extract_links([url], all_urls, download_urls)
            project_data[name] = {'urls': list(set(all_urls)), 'download_urls': list(set(download_urls))}

        pickle.dump(project_data, open("project_data.p", "wb"))
    else:
        project_data = pickle.load(open("project_data.p", "rb"))



    # p_data = {}
    # for name, info in project_data.items():
    #     p_data[name] = {'urls': list(set(info['urls'])), 'download_urls': list(set(info['download_urls']))}
    #
    #
    print("Project Info")
    print(project_data)
    #
    # for project_name, project_info in project_data.items():
    #     p_download_urls = project_info['download_urls']
    #
    #     for p_url in p_download_urls:
    #         a = urlparse(p_url)
    #         file_name = os.path.basename(a.path)
    #         sanitized_project_name = format_filename(project_name)
    #
    #         file_path = f"{FILE_LOCATION}\\pdf\\{sanitized_project_name}\\{file_name}.pdf"
    #
    #         os.makedirs(os.path.dirname(file_path), exist_ok=True)
    #         _f = Path(file_path)
    #         if not _f.is_file():
    #             #file doesn't exist
    #             res = urlopen(p_url)
    #             pdf = open(file_path, 'wb')
    #             pdf.write(res.read())
    #             pdf.close()
    #
