import 'package:flutter/material.dart';
import 'package:view/widgetmodels/exercise.dart';
import '../../widgetmodels/set.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key? key}) : super(key: key);

  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  List<Exercise> exercises = [Exercise()];

  @override
  Widget build(BuildContext context) {
    return ListView(children: show());
  }

  List<Widget> show() {
    List<Widget> build = [];
    build.add(ElevatedButton(
        child: Text("Add Exercise"),
        onPressed: () {
          setState(() {
            exercises.add(Exercise());
          });
        }));

    for (int i = 0; i < exercises.length; i++) {
      build.add(exercises[i]);
    }
    build.add(ElevatedButton(
      child: Text("Finish Workout"),
      onPressed: () {
        makeClass();
      },
    ));
    return build;
  }

  void makeClass() {
    for (int i = 0; i < exercises.length; i++) {
      print(exercises[i].exerciseController.text);
      for(int j = 0; j < exercises[i].sets.length; j++) {
        print(exercises[i].sets[j].repsController.text);
      }
    }
  }
}
