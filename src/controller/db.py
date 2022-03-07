import pymongo
from pymongo import MongoClient

class Database:
    def __init__(self):
        cluster = MongoClient(
            "mongodb+srv://sauceque:Cricket123@cluster0.rahww.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
        db = cluster['WorkoutApp']
        self.collection = db['users']

    def addUser(self, username, userEmail):
        if self.collection.find_one(username) == None:
            return {'success' : False, 'message' : 'user already exists'}, 400
        data = {
            username: {
                "userEmail": userEmail,
            }
        }
        self.collection.update_one(
            {},
            {
                "$set" : data
            },
            upsert=False,
            array_filters=None
        )
        if self.collection.find_one(data) == None:
            return {'success' : False, 'message' : 'could not add user'}, 400
        
        return {'success' : True, 'message' : 'successfully added user'}, 200
        
