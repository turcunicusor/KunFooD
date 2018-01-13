import requests


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


def send_recipies(url, recipes):
    headers = {'content-type': 'application/json-patch+json'}
    err = 0
    for recipe in recipes:
        body = recipe
        response = requests.post(url=url, data=body, headers=headers)
        if response.status_code != 200:
            print("Failed to request. Status code: " + response.status_code + " Reason: " + response.content)
            err += 1
    return err
