import json

def readFile():
    f = open('plans.json')
    data = json.load(f)
    print(data)
    return data

def appendToFile(new_data):
    with open("plans.json",'r+') as file:
        file_data = json.load(file)
        file_data.append(new_data)
        print(file_data)
        file.seek(0)
        json.dump(file_data, file, indent=4)
