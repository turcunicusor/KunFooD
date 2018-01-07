import food2fork as f2f
import world_openfoodfacts as woff
import ingredients_parser as ip
import utils as u
import json
import food_ndtv_parser as food_ndfv


def f2f_api():
    result = f2f.send_requests(2)
    links = f2f.parse_api_response(result)
    recipes = []
    for website in f2f.valid_websites.keys():
        data = f2f.get_recipes_html(links[website])
        recipes.extend(f2f.valid_websites[website](data))
    d = dict()
    d["count"] = len(recipes)
    d["recipies"] = recipes
    print(d)
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


# ing_only()
# ing_with_categ()
f2f_api()

# to check encoding at output
# to validate add measurement unit where I can do that
