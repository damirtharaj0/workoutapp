from flask import Flask
from flask_restful import Api
from plans import Plans

app = Flask(__name__)
api = Api(app)

api.add_resource(Plans, "/plans")

if __name__ == "__main__":
    app.run(debug=True)