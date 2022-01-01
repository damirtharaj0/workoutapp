from flask import Flask, request, jsonify
import fileio

app = Flask(__name__)
app.config["JSON_SORT_KEYS"] = False

@app.route("/plans", methods = ["GET"])
def get_plans():
    return jsonify(fileio.readFile())

@app.route("/finishedplan", methods = ["POST"])
def post_plans():
    value = request.json
    # return value
    fileio.appendToFile(value)
    # return jsonify(value)

if __name__ == "__main__":
    app.run(debug=True)