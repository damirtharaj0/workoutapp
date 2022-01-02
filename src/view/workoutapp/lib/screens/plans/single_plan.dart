import 'package:flutter/material.dart';
import '../../models/plan_class.dart';
import 'expanded_plan.dart';

class SinglePlan extends StatelessWidget {
  late final Plan plan;
  // late final planName;
  // late final exerciseNames;
  // late final reps;
  // late final weight;

  SinglePlan(Plan plan) {
    this.plan = plan;
    // this.planName = plan.planName;
    // this.exerciseNames = plan.exerciseNames;
    // this.reps = plan.reps;
    // this.weight = plan.weight;
  }

  @override
  Widget build(BuildContext context) {
    plan.calculateTotalVolume();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 136,
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    plan.planName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Column(
                    children: [
                      Text("Total Volume"),
                      Text(plan.totalVolume.toString())
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => ExpandedPlan(plan)
            ));
            // showDialog(
            //     context: context,
            //     builder: (_) {
            //       return PlanDialog(plan);
            //     });
          },
        ),
      ),
    );
  }

  List<Widget> showExercises(BuildContext context) {
    List<Widget> names = [];
    if (plan.exerciseNames.length < 5) {
      for (int i = 0; i < plan.exerciseNames.length; i++) {
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
