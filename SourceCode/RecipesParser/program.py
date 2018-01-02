import api_parser as a
import utils as u
import json

#
result = a.send_requests(15)
links = a.parse_api_response(result)
recipes = []
for website in a.valid_websites.keys():
    data = a.get_recipes_html(links[website])
    recipes.extend(a.valid_websites[website](data))
#
# recipes = a.parse_recipes_twopeasandtheirpod(a.get_recipes_html(links["www.closetcooking.com"]))
d = dict()
d["count"] = len(recipes)
d["recipies"] = recipes
print(d)
u.write(json.dumps(d))
