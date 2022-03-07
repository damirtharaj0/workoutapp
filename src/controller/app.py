from flask import Flask, request, jsonify
import fileio
from db import Database
import json

db = Database()
app = Flask(__name__)
app.config["JSON_SORT_KEYS"] = False

@app.route("/plans", methods = ["GET"])
def get_plans():
    return jsonify(fileio.readFile())

@app.route("/finishedplan", methods = ["POST"])
def post_plans():
    value = request.json
    fileio.appendToFile(value)
    return jsonify(value)

@app.route("/add_user", methods = ["POST"])
def addUser():
    value = request.json
    print(value)
    return db.addUser(value['username'], value['user_email'])

app.run()