import food2fork as f2f
import world_openfoodfacts as woff
import ingredients_parser as ip
import utils as u
import json, sys
import food_ndtv_parser as food_ndfv
from semantics3 import Products
import time

sem3 = Products(api_key="SEM37B78A6306695816904F3BB8C677F71D8",
                api_secret="OTg4OWJiN2ZhZjc0Y2Q5ZjJhODIyNDE2MzhhZDM2ZmY")


def f2f_api():
    result = f2f.send_requests(11, 16)
    links = f2f.parse_api_response(result)
    recipes = []
    for website in f2f.valid_websites.keys():
        data = f2f.get_recipes_html(links[website])
        recipes.extend(f2f.valid_websites[website](data))
    d = dict()
    d["count"] = len(recipes)
    d["recipies"] = recipes
    # print(d)
    u.write(json.dumps(d), "food2fork")


def ing_with_categ():
    ingredients_with_category = food_ndfv.parse()
    u.write(json.dumps(ingredients_with_category), "ingredients_with_category", "")
    print(ingredients_with_category)


def ing_only():
    ingredients = ip.get_ingredients()
    u.write(json.dumps(ingredients), "ingredients", "")
    print(ingredients)
    print("total:", len(ingredients))


def worldopenfoodfacts_experimental():
    data = woff.send_requests()
    res = woff.parse_responses(data)
    print(json.dumps(res))


def get_price(name):
    time.sleep(0.5)
    default = "undefined"
    sem3.products_field("search", name)
    sem3.products_field("fields", ["weight", "price", "price_currency"])
    results = sem3.get_products()
    d = dict()
    for result in results["results"]:
        d = dict()
        d["weight"] = result.get("weight", default)
        d["price"] = result.get("price", default)
        d["price_currency"] = result.get("price_currency", default)
        if d["weight"] != default and d["price"] != default and d["price_currency"] != default:
            break
    return d


def read_recipies(file_name):
    data = json.loads(u.read(file_name))
    recipes = []
    for recipe in data["recipes"]:
        try:
            print(recipe["name"])
            r = dict()
            r['name'] = recipe["name"]
            r["summary"] = recipe["summary"]
            r["content"] = recipe["content"]
            r["preparationTime"] = int(recipe["preparation_time"])
            r["servings"] = int(recipe["servings"])
            ing = []
            for ingredient in recipe["ingredients"]:
                i = dict()
                i["quantity"] = float(ingredient["quantity"])
                i["name"] = ingredient["name"]
                i["measurementUnit"] = ingredient["measured_unit"]
                i["category"] = ingredient["category"]
                dt = get_price(i["name"])
                i["price"] = dt["price"]
                i["weight"] = dt["weight"]
                i["price_currency"] = dt["price_currency"]
                ing.append(i)
            r["ingredients"] = ing
            recipes.append(r)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return recipes


def read_recipies_v2(file_name):
    data = json.loads(u.read(file_name))
    recipes = []
    for recipe in data:
        try:
            r = dict()
            r['name'] = recipe["name"]
            r["summary"] = recipe["summary"]
            r["content"] = recipe["content"]
            r["preparationTime"] = int(recipe["preparationTime"])
            r["servings"] = int(recipe["servings"])
            ing = []
            for ingredient in recipe["ingredients"]:
                i = dict()
                i["quantity"] = float(ingredient["quantity"])
                i["name"] = ingredient["name"]
                i["measurementUnit"] = ingredient["measurementUnit"]
                i["category"] = ingredient["category"]
                i["cost"] = float(ingredient["price"])
                i["weight"] = float(ingredient["weight"])
                i["priceCurrency"] = ingredient["price_currency"]
                ing.append(i)
            r["ingredients"] = ing
            recipes.append(r)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            print("Failed to parse recipie. Error", str(e), "Line:", exc_tb.tb_lineno)
    return recipes

def func():
    ingredients = json.loads(u.read("_ingredients.json"))
    r = []
    default = "undefined"
    for ingredient in ingredients:
        print(ingredient)
        sem3.products_field("search", ingredient)
        sem3.products_field("fields", ["weight", "price", "price_currency"])
        results = sem3.get_products()
        d = dict()
        for result in results["results"]:
            d = dict()
            d["name"] = ingredient
            d["weight"] = result.get("weight", default)
            d["price"] = result.get("price", default)
            d["price_currency"] = result.get("price_currency", default)
            if d["weight"] != default and d["price"] != default and d["price_currency"] != default:
                break
        r.append(d)
    u.write(json.dumps(r), "semantic", "s")


# ing_only()
# ing_with_categ()
# f2f_api()
# x = f2f.measured_unit_potentials
# u.write(json.dumps(x), "measured_unit_potentials", "")

# atentie unele ingrediente se repeta, de validat asta
# dupa ce se stabileste numele sa se faca automat sau manual

def exec():
    recipes = read_recipies("recipies_food2fork_valid_all.json")
    u.write(json.dumps(recipes), "last_result", "_data_important")
    # error, res = u.send_recipes("http://localhost:55383/api/Recipes/", recipes)
    # print("Failed requests: " + str(error))

# print(get_price("lemon juice"))

if __name__ == "__main__":
    recipes = read_recipies_v2("data_to_populate_database.json")
    error, res = u.send_recipes("http://localhost:55383/api/Recipes/", recipes)
    print("Failed requests: " + str(error))