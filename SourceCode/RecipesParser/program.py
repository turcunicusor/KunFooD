import food2fork as f2f
import world_openfoodfacts as woff
import utils as u
import json

def f2f_api():
    result = f2f.send_requests(1)
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

# f2f_api()
data = woff.send_requests()
res = woff.parse_responses(data)
print(json.dumps(res))