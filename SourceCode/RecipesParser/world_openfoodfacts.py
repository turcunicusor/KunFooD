from urllib.request import Request, urlopen
import sys
import json


def send_requests():
    url_req_template = "http://world.openfoodfacts.org/api/v0/product/{barcode}.json"
    barcodes = ["737628064502"]
    responses = []
    for barcode in barcodes:
        url = url_req_template.format(barcode=barcode)
        print(url)
        try:
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            response = urlopen(req).read()
            responses.append(json.loads(response.decode('latin-1')))
            print("Success request to:", url)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed request to:", url, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return responses


def parse_responses(responses):
    d_recipes = dict()
    d_recipes["count"] = 0
    d_recipes["recipes"] = []

    for response in responses:
        d = dict()
        d["name"] = response["product"]["generic_name"]
        # d["summary"] = summary
        # d["content"] = content
        # d["preparation_time"] = total_time
        # d["servings"] = servings
        d["ingredients"] = [i["text"] for i in response["product"]["ingredients"]]
        d_recipes["recipes"].append(d)
        d_recipes["count"] += 1

    return d_recipes
