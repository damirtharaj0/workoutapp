import 'package:flutter/material.dart';
import '../../models/plan_class.dart';
import 'plan_dialog.dart';

class SinglePlan extends StatelessWidget {
  late final Plan plan;
  late final planName;
  late final exerciseNames;
  late final reps;
  late final weight;

  SinglePlan(Plan plan) {
    this.plan = plan;
    this.planName = plan.planName;
    this.exerciseNames = plan.exerciseNames;
    this.reps = plan.reps;
    this.weight = plan.weight;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.width * .3,
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    planName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                  Column(
                    children: showExercises(context),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            showDialog(context: context, builder: (_) {
              return PlanDialog(plan);
            });
          },
        ),
      ),
    );
  }

  List<Widget> showExercises(BuildContext context) {
    List<Widget> names = [];
    if (exerciseNames.length < 5) {
      for (int i = 0; i < exerciseNames.length; i++) {
        names.add(Text(
          plan.exerciseNames[i],
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      }
    } else {
      for (int i = 0; i < 4; i++) {
        names.add(Text(
          plan.exerciseNames[i],
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      }
      names.add(Text(
        '. . .',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    }
    return names;
  }

  
}




// import 'package:flutter/material.dart';
// import 'PlanClass.dart';
// import 'PlanDialog.dart';

// class SinglePlan extends StatelessWidget {
//   late final Plan plan;
//   late final planName;
//   late final exerciseNames;
//   late final reps;
//   late final weight;

//   SinglePlan(Plan plan) {
//     this.plan = plan;
//     this.planName = plan.planName;
//     this.exerciseNames = plan.exerciseNames;
//     this.reps = plan.reps;
//     this.weight = plan.weight;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         width: MediaQuery.of(context).size.width * .7,
//         height: MediaQuery.of(context).size.width * .3,
//         child: GestureDetector(
//           child: Card(
//             elevation: 10,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Text(
//                     planName,
//                   )),
//                   Column(
//                     children: showExercises(context),
//                     mainAxisAlignment: MainAxisAlignment.center,
//                   ),
//                 ],
//               ),
//             ),
            
//           ),
//           onTap : () {
//               showDialog(
//                 context: context,
//                 builder: (_) {
//                   return PlanDialog(plan);
//                 },
//               );
//             },
//         ),
//       ),
//     );
//   }

//   List<Widget> showExercises(BuildContext context) {
//     List<Widget> names = [];
//     if (exerciseNames.length < 5) {
//       for (int i = 0; i < exerciseNames.length; i++) {
//         names.add(Text(plan.getExerciseNames[i]));
//       }
//     } else {
//       for (int i = 0; i < 4; i++) {
//         names.add(Text(plan.getExerciseNames[i]));
//       }
//       names.add(Text('. . .'));
//     }
//     return names;
//   }
// }
