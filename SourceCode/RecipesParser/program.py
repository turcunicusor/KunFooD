import food2fork as f2f
import world_openfoodfacts as woff
import ingredients_parser as ip
import utils as u
import json
import food_ndtv_parser as food_ndfv


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


def read_recipies(file_name):
    data = json.loads(u.read(file_name))
    recipes = []
    for recipe in data["recipes"]:
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
            ing.append(i)
        r["ingredients"] = ing
        recipes.append(r)
    # for recipe in recipes:
    #     if recipe["name"] == "Maple Bourbon Bacon Jam":
    #         print(json.dumps(recipe, sort_keys=True, indent=4, separators=(',', ': ')))
    return recipes

# ing_only()
# ing_with_categ()
# f2f_api()
# x = f2f.measured_unit_potentials
# u.write(json.dumps(x), "measured_unit_potentials", "")

# atentie unele ingrediente se repeta, de validat asta
# dupa ce se stabileste numele sa se faca automat sau manual

recipes = read_recipies("recipies_food2fork_valid_all.json")
error, res = u.send_recipes("http://localhost:55383/api/Recipes/", recipes)
print("Failed requests: " + str(error))