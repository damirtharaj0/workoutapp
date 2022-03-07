from flask import Flask, request, jsonify
import fileio
from db import Database
import json

db = Database()
app = Flask(__name__)
app.config["JSON_SORT_KEYS"] = False

@app.route("/plans", methods = ["GET"])
def get_plans():
    return db.getPlans()
    # return jsonify(fileio.readFile())

@app.route("/addPlan", methods = ["POST"])
def addPlan():
    value = request.json
    print(value)
    return db.addPlan(value['planName'], value['exerciseNames'], value['reps'], value['weight'])
    # planName, exerciseNames, reps, weight

@app.route("/add_user", methods = ["POST"])
def addUser():
    value = request.json
    print(value)
    return db.addUser(value['username'], value['user_email'])

app.run()