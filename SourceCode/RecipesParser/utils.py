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