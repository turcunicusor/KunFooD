def write(data, file_name="recipies.json"):
    try:
        with open(file_name, "w", encoding="latin-1") as f:
            f.write(data)
    except Exception as e:
        print("Error at writing to file. Error:", str(e))
