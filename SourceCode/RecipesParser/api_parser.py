from urllib.request import Request, urlopen
import json
from pyquery import PyQuery
from html import unescape
import sys, os

valid_websites = {
    "www.closetcooking.com": lambda recipes: parse_recipes_closetcooking(recipes),
    "www.thepioneerwoman.com": lambda recipes: parse_recipes_thepioneerwoman(recipes),
    "www.allrecipes.com": lambda recipes: parse_recipes_allrecipes(recipes),
    "www.twopeasandtheirpod.com": lambda recipes: parse_recipes_twopeasandtheirpod(recipes),
}


def send_requests(page_nr=1):
    app_key = "b0ea215bec6aec0022f947193a1f6f02"
    url_req_template = "http://food2fork.com/api/search?key={key}&page={page}"
    responses = []
    for i in range(0, page_nr):
        url = url_req_template.format(key=app_key, page=i)
        try:
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            response = urlopen(req).read()
            responses.append(response.decode('latin-1'))
            print("Success request to:", url)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed request to:", url, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return responses


def parse_api_response(responses):
    recipes_links = {key: [] for key in valid_websites.keys()}
    for response in responses:
        j = json.loads(response)
        # count = j["count"]
        for recipe in j["recipes"]:
            recipe_url = recipe["source_url"]
            result = validate_url(recipe_url)
            if result:
                recipes_links[result].append(recipe_url)
    # make links unique
    for key, value in recipes_links.items():
        value = list(set(value))
    return recipes_links


def validate_url(recipe_url):
    for website in valid_websites.keys():
        if website in recipe_url:
            return website
    return False


def get_recipes_html(links):
    results = []
    for link in links:
        try:
            req = Request(link)
            response = urlopen(req).read()
            results.append(response.decode('latin-1'))
            print("Success request to:", link)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed request to:", link, "Error:", str(e), "Line:", exc_tb.tb_lineno)
    return results


def parse_recipes_closetcooking(recipes):
    d_recipes = list()
    for recipe in recipes:
        try:
            pq = PyQuery(recipe)
            tag = pq(".recipe")
            name = tag(".recipe_title").text()
            time = tag(".time:nth-child(3)")
            total_time = time.text().split(":")[1].lstrip()  # bug
            servings = tag(".details .yield").text().split(":")[1].lstrip()
            content = tag(".instructions").text()
            summary = tag(".summary").text()
            ingredients = [i.text() for i in tag(".ingredients").items("li")]

            d = dict()
            d["name"] = name
            d["summary"] = summary
            d["content"] = content
            d["preparation_time"] = total_time
            d["servings"] = servings
            d["ingredients"] = ingredients
            d_recipes.append(d)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return unescape(d_recipes)


def parse_recipes_thepioneerwoman(recipes):
    d_recipes = list()
    for recipe in recipes:
        try:
            pq = PyQuery(recipe)
            tag = pq(".entry-content")
            name = tag(".recipe-title").text()
            total_time = ""
            servings = ""
            for i in tag(".recipe-summary-time").items("dl"):
                if i("dt").text() == "Prep Time:":
                    total_time = i("dd").text()
                if i("dt").text() == "Servings:":
                    servings = i("dd").text()
            content = tag(".panel:nth-child(2) .panel-body").text()
            summary = None
            ingredients = [i.text() for i in tag(".list-ingredients").items("li")]

            d = dict()
            d["name"] = name
            d["summary"] = summary
            d["content"] = content
            d["preparation_time"] = total_time
            d["servings"] = servings
            d["ingredients"] = ingredients
            d_recipes.append(d)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return unescape(d_recipes)


def parse_recipes_allrecipes(recipes):
    d_recipes = list()
    for recipe in recipes:
        try:
            pq = PyQuery(recipe)
            tag = pq(".full-page")
            name = pq(".summary-background .recipe-summary__h1").text()
            total_time = tag(".recipe-ingredients__header__toggles .ready-in-time").text()
            servings = tag(".recipe-ingredients__header__toggles").find("meta").attr("content")
            content = "".join([i("span").text() for i in tag(".directions--section__steps .list-numbers").items("li")])
            summary = None
            ingredients = [i.find("span").html() for i in tag(".checklist").items("li")]
            if ingredients[-3] == "Add all ingredients to list":
                del ingredients[-3:]
            d = dict()
            d["name"] = name
            d["summary"] = summary
            d["content"] = content
            d["preparation_time"] = total_time
            d["servings"] = servings
            d["ingredients"] = ingredients
            d_recipes.append(d)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return unescape(d_recipes)


def parse_recipes_twopeasandtheirpod(recipes):
    d_recipes = list()
    for recipe in recipes:
        try:
            pq = PyQuery(recipe)
            tag = pq(".recipe")
            name = tag.find("h2").find("span").text()
            total_time = ""
            for i in tag(".time").items("p"):
                if i("strong").text() == "Total Time:":
                    total_time = i.text().split(":")[1].lstrip()
            servings = tag(".time p span").html()
            content = tag(".instructions").text()
            summary = tag(".summary").text()
            ingredients = [i.text() for i in tag(".ingredients").items("li")]

            d = dict()
            d["name"] = name
            d["summary"] = summary
            d["content"] = content
            d["preparation_time"] = total_time
            d["servings"] = servings
            d["ingredients"] = ingredients
            d_recipes.append(d)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return unescape(d_recipes)
