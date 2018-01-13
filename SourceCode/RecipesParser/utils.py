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
        # body = json.loads(str(recipe))
        # while True:
        #     try:
        #         result = json.loads(body)  # try to parse...
        #         break  # parsing worked -> exit loop
        #     except Exception as e:
        #         # "Expecting , delimiter: line 34 column 54 (char 1158)"
        #         # position of unexpected character after '"'
        #         unexp = int(re.findall(r'\(char (\d+)\)', str(e))[0])
        #         # position of unescaped '"' before that
        #         unesc = body.rfind(r'"', 0, unexp)
        #         body = body[:unesc] + r'\"' + body[unesc + 1:]
        #         # position of correspondig closing '"' (+2 for inserted '\')
        #         closg = body.find(r'"', unesc + 2)
        #         body = body[:closg] + r'\"' + body[closg + 1:]
        # print(json.dumps(body, sort_keys=True, indent=4, separators=(',', ': ')))
        response = requests.post(url=url, data=body, headers=headers)
        if response.status_code != 200:
            print("Failed to request. Status code: " + str(response.status_code))
            # print("Failed to request. Status code: " + str(response.status_code) + " Reason: " + str(response.content))
            # print(body)
            err += 1
        elif response.status_code == 200:
            print("Request success!")
    return err, response.content
