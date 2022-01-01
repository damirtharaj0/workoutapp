import json

def readFile():
    f = open('plans.json')
    data = json.load(f)
    return data

def appendToFile(new_data):
    with open("plans.json",'r+') as file:
          # First we load existing data into a dict.
        file_data = json.load(file)
        # Join new_data with file_data inside emp_details
        file_data.append(new_data)
        print(file_data)
        # Sets file's current position at offset.
        file.seek(0)
        # convert back to json.
        json.dump(file_data, file, indent=4)
