import requests

url = "http://127.0.0.1:5000/"

response = requests.get(url + "plans")
print(response.json())