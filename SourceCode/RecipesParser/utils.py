def write(data, api, file_name="recipies"):
    try:
        with open(file_name + "_" + api + ".json", "w", encoding="latin-1") as f:
            f.write(data)
    except Exception as e:
        print("Error at writing to file. Error:", str(e))
