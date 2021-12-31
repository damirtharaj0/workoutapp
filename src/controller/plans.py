from flask_restful import Resource
import json


class Plans(Resource):
    plans = [
        {
            "planName": "Push",
            "exerciseNames": [
                "Bench Press",
                "Machine Shoulder Press",
                "Dips",
                "Skullcrushers",
                "Cable Lateral Raises",
                "Cable Kickbacks"
            ],
            "reps": [
                [
                    4,
                    2,
                    6
                ],
                [
                    4,
                    3,
                    2
                ],
                [
                    4,
                    2,
                    5
                ],
                [
                    2,
                    3,
                    5
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ]
            ],
            "weight": [
                [
                    4,
                    2,
                    6
                ],
                [
                    4,
                    3,
                    2
                ],
                [
                    4,
                    2,
                    5
                ],
                [
                    2,
                    3,
                    5
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ]
            ]
        },
        {
            "planName": "Pull",
            "exerciseNames": [
                "Pull Ups",
                "Seated Cable Row",
                "Cable Pullover",
                "Hammer Curls",
                "Incline Dumbbell Curls"
            ],
            "reps": [
                [
                    6,
                    5,
                    6
                ],
                [
                    12,
                    12,
                    11
                ],
                [
                    11,
                    12,
                    11
                ],
                [
                    15,
                    14,
                    15
                ],
                [
                    15,
                    14,
                    12
                ]
            ],
            "weight": [
                [
                    45,
                    45,
                    45
                ],
                [
                    50,
                    50,
                    50
                ],
                [
                    30,
                    30,
                    30
                ],
                [
                    25,
                    25,
                    25
                ],
                [
                    15,
                    15,
                    15
                ]
            ]
        },
        {
            "planName": "Legs",
            "exerciseNames": [
                "Squat",
                "Romanian Deadlifts",
                "Single Leg Press",
                "Leg Extensions",
                "Seated Leg Curls",
                "Standing Calf Raises",
                "Decline Crunches",
                "Long Lever Planks"
            ],
            "reps": [
                [
                    4,
                    2,
                    6
                ],
                [
                    4,
                    3,
                    2
                ],
                [
                    4,
                    2,
                    5
                ],
                [
                    2,
                    3,
                    5
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ]
            ],
            "weight": [
                [
                    4,
                    2,
                    6
                ],
                [
                    4,
                    3,
                    2
                ],
                [
                    4,
                    2,
                    5
                ],
                [
                    2,
                    3,
                    5
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ],
                [
                    4,
                    2,
                    4
                ]
            ]
        }
    ]

    def get(self):
        return self.plans
