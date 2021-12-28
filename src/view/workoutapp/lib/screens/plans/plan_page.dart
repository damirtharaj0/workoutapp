import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/screens/plans/single_plan.dart';
import 'package:flutter/services.dart' as service;

class PlansPage extends StatefulWidget {
  const PlansPage({ Key? key }) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {


  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: getJsonData(),
      builder: (context, jsonData) {
        List plans = [];
        plans = jsonData.data as List;
        if(jsonData.hasData) {
          return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SinglePlan(plans[index]),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List> getJsonData() async {
    final jsonData = await service.rootBundle.loadString('assets/plans.json');
    final list = json.decode(jsonData) as List;
    return list.map((e) => Plan.fromJson(e)).toList();
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:view/models/plan_class.dart';
// import 'package:view/screens/plans/single_plan.dart';
// import 'package:flutter/services.dart' as service;

// class PlansPage extends StatefulWidget {
//   const PlansPage({ Key? key }) : super(key: key);

//   @override
//   _PlansPageState createState() => _PlansPageState();
// }

// class _PlansPageState extends State<PlansPage> {


//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       initialData: [],
//       future: getJsonData(),
//       builder: (context, jsonData) {
//         List plans = [];
//         plans = jsonData.data as List;
//         if(jsonData.hasData) {
//           return ListView(
//             physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//             children: buildPlanCards(context, plans),
//           );
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }

//   Future<List> getJsonData() async {
//     final jsonData = await service.rootBundle.loadString('assets/plans.json');
//     final list = json.decode(jsonData) as List;
//     return list.map((e) => Plan.fromJson(e)).toList();
//   }

//   List<Widget> buildPlanCards(BuildContext context, List plans) {
//     List<Widget> plansContainer = [Container(height: 40)];
//     for (int i = 0; i < plans.length; i++) {
//       plansContainer.add(Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: SinglePlan(plans[i]),
//       ));
//     }
//     return plansContainer;
//   }
// }





// import 'package:flutter/material.dart';
// import 'PlanClass.dart';
// import 'SinglePlan.dart';

// class Plans extends StatelessWidget {
//   final jsonData = [
//     {
//       "planName": "Push",
//       "exerciseNames": [
//         "Pull Ups",
//         "Seated Cable Row",
//         "Cable Pullover",
//         "Hammer Curls",
//         "Incline Dumbbell Curls"
//       ],
//       "reps": [
//         [6, 5, 6],
//         [12, 12, 11],
//         [11, 12, 11],
//         [15, 14, 15],
//         [15, 14, 12]
//       ],
//       "weight": [
//         [45, 45, 45],
//         [50, 50, 50],
//         [30, 30, 30],
//         [25, 25, 25],
//         [15, 15, 15]
//       ]
//     },
//     {
//       "planName": "Pull",
//       "exerciseNames": [
//         "Bench Press",
//         "Machine Shoulder Press",
//         "Dips",
//         "Skullcrushers",
//         "Cable Lateral Raises",
//         "Cable Kickbacks"
//       ],
//       "reps": [
//         [4, 2, 6],
//         [4, 3, 2],
//         [4, 2, 5],
//         [2, 3, 5],
//         [4, 2, 4],
//         [4, 2, 4]
//       ],
//       "weight": [
//         [4, 2, 6],
//         [4, 3, 2],
//         [4, 2, 5],
//         [2, 3, 5],
//         [4, 2, 4],
//         [4, 2, 4]
//       ]
//     },
//     {
//       "planName": "Legs",
//       "exerciseNames": [
//         "Squat",
//         "Romanian Deadlifts",
//         "Single Leg Press",
//         "Leg Extensions",
//         "Seated Leg Curls",
//         "Standing Calf Raises",
//         "Decline Crunches",
//         "Long Lever Planks"
//       ],
//       "reps": [
//         [4, 2, 6],
//         [4, 3, 2],
//         [4, 2, 5],
//         [2, 3, 5],
//         [4, 2, 4],
//         [4, 2, 4],
//         [4, 2, 4],
//         [4, 2, 4]
//       ],
//       "weight": [
//         [4, 2, 6],
//         [4, 3, 2],
//         [4, 2, 5],
//         [2, 3, 5],
//         [4, 2, 4],
//         [4, 2, 4],
//         [4, 2, 4],
//         [4, 2, 4]
//       ]
//     }
//   ];

//   Widget build(BuildContext context) {
//     List<Plan> plans = getPlans();
//     return ListView(
//       physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//       children: buildPlanCards(context, plans),
//     );
//   }

//   List<Plan> getPlans() {
//     List<Plan> plans = [];
//     for (int i = 0; i < jsonData.length; i++) {
//       plans.add(Plan.fromJson(jsonData[i]));
//     }
//     return plans;
//   }

//   List<Widget> buildPlanCards(BuildContext context, List<Plan> plans) {
//     List<Widget> plansContainer = [Container(height: 40)];
//     for (int i = 0; i < plans.length; i++) {
//       plansContainer.add(Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: SinglePlan(plans[i]),
//       ));
//     }
//     return plansContainer;
//   }
// }
