import pymongo
from pymongo import MongoClient

class Database:
    def __init__(self):
        cluster = MongoClient(
            "mongodb+srv://Username:Password@cluster0.rahww.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
        db = cluster['WorkoutApp']
        self.users = db['users']
        self.plans = db['plans']

    def addUser(self, username, userEmail):
        if self.users.find_one(username) == None:
            return {'success' : False, 'message' : 'user already exists'}, 400
        data = {
            username: {
                "userEmail": userEmail,
            }
        }
        self.users.update_one(
            {},
            {
                "$set" : data
            },
            upsert=False,
            array_filters=None
        )
        if self.users.find_one(data) == None:
            return {'success' : False, 'message' : 'could not add user'}, 400
        
        return {'success' : True, 'message' : 'successfully added user'}, 200

    def getPlans(self):
        plans = self.plans.find()
        planslst = []
        plan = plans[0]
        print
        for i in range(1, len(plan)):
            plntpl = list(plan.items())[i]
            planDict = plntpl[1]
            planDict["planName"] = plntpl[0]
            planslst.append(planDict)
        return {'success' : True, 'data' : planslst}, 200

    def addPlan(self, planName, exerciseNames, reps, weight):
        data = {
            planName : {
                "exerciseNames" : exerciseNames,
                "reps" : reps,
                "weight" : weight,
                "totalVolume" : 10
            }
        }
        self.plans.update_one(
            {},
            {
                "$set" : data
            },
            upsert=False,
            array_filters=None
        )
        if self.plans.find_one(data) == None:
            return {'success' : False, 'message' : 'could not add plan'}, 400
        return {'success' : True, 'message' : 'successfully added plan'}, 200
        
