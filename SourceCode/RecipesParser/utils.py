import requests
import json
import re


def write(data, api, file_name="recipies"):
    try:
        with open(file_name + "_" + api + ".json", "w", encoding="latin-1") as f:
            f.write(data)
    except Exception as e:
        print("Error at writing to file. Error:", str(e))


def read(file_name):
    try:
        with open(file_name, "r", encoding="latin-1") as f:
            return f.read()
    except Exception as e:
        print("Error at reading from file. Error:", str(e))


def send_recipes(url, recipes):
    headers = {'content-type': 'application/json-patch+json'}
    err = 0
    for recipe in recipes:
        body = str(json.dumps(recipe, sort_keys=True, indent=4, separators=(',', ': ')))
        response = requests.post(url=url, data=body, headers=headers)
        if response.status_code != 200:
            print("Failed to request. Status code: " + str(response.status_code))
            # print("Failed to request. Status code: " + str(response.status_code) + " Reason: " + str(response.content))
            # print(body)
            err += 1
        elif response.status_code == 200:
            print("Request success!")
    return err, response.content


def send_request(url, params):
    response = requests.get(url, params=params)
    print(response.status_code, response.content)