from string import ascii_lowercase
from urllib.request import Request, urlopen
from pyquery import PyQuery
import sys


def send_requests():
    url_req_template = "http://www.bbc.co.uk/food/ingredients/by/letter/{letter}"
    responses = []
    for letter in ascii_lowercase:
        url = url_req_template.format(letter=letter)
        try:
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            response = urlopen(req).read()
            responses.append(response.decode('latin-1'))
            print("Success request to:", url)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed request to:", url, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return responses


def get_ingredients():
    pages = send_requests()
    ingredients = []
    for page in pages:
        pq = PyQuery(page)(".grid-view")
        ig = [i.attr("id") for i in pq.items("li")]
        ig = [i.replace("_", " ") for i in ig]
        ingredients.extend(ig)
    return ingredients
