from string import ascii_lowercase
from urllib.request import Request, urlopen
from pyquery import PyQuery
import sys


def send_requests(ing_categ):
    url_req_template = "https://food.ndtv.com/ingredient/{ing_categ}/page-{page}"
    responses = []
    for page in range(1, 6):
        url = url_req_template.format(ing_categ=ing_categ, page=page)
        try:
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            response = urlopen(req).read()
            responses.append(response.decode('latin-1'))
            print("Success request to:", url)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed request to:", ing_categ, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return responses


def send_request(url):
    try:
        req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        response = urlopen(req).read()
        return response.decode('latin-1')
    except Exception as e:
        exc_type, exc_obj, exc_tb = sys.exc_info()
        print("Failed request to:", url, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return None


def parse():
    url = "https://food.ndtv.com/ingredient"
    response = send_request(url)
    ingredients_category = ing_categ_parse(response)
    result = dict()
    for ing_categ in ingredients_category:
        ing = list()
        for ing_page in send_requests(ing_categ):
            try:
                pq = PyQuery(ing_page)(".vdo_lst")
                ing.extend([i.text().lower() for i in pq.items("li") if i.text() != "No Record Found"])
            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                print("Failed to parse page.", "Error:", str(e), "Line:", exc_tb.tb_lineno)
        result[ing_categ] = {"count":len(ing), "ing":ing}
    return result


def ing_categ_parse(response):
    pq = PyQuery(response)(".vdo_lst")
    ing_categ = [i.text().lower().replace(" ", "-") for i in pq.items("li")]
    return ing_categ
