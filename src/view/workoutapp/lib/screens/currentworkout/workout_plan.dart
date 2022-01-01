import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/widgetmodels/exercise.dart';

import 'current_workout_page.dart';

class WorkoutPlan extends StatefulWidget {
  List<Exercise> exercises = [Exercise()];
  List pageBuild = [];
  TextEditingController workoutNameController = new TextEditingController();
  final ValueChanged<bool> update;
  WorkoutPlan({required this.update});

  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    buildPage();
    return ListView.builder(
      itemCount: widget.pageBuild.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.pageBuild[index];
      },
    );
  }

  void buildPage() {
    widget.pageBuild = [
      TextField(
        controller: widget.workoutNameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Workout Name",
        ),
      )
    ];
    widget.pageBuild.add(ElevatedButton(
        child: Text("Add Exercise"),
        onPressed: () {
          setState(() {
            widget.exercises.add(Exercise());
          });
        }));

    for (int i = 0; i < widget.exercises.length; i++) {
      widget.pageBuild.add(Dismissible(
        child: widget.exercises[i],
        onDismissed: (left) {
          setState(() {
            widget.exercises.removeAt(i);
          });
        },
        key: UniqueKey(),
      ));
    }
    widget.pageBuild.add(ElevatedButton(
      child: Text("Finish Workout"),
      onPressed: () {
        Plan plan = makeClass();
        widget.update(false);
      },
    ));
  }

  Plan makeClass() {
    String workoutName = (widget.workoutNameController.text);
    List<String> exerciseNames = [];
    List<List<int>> weight = [];
    List<List<int>> reps = [];

    for (int i = 0; i < widget.exercises.length; i++) {
      exerciseNames.add(widget.exercises[i].exerciseController.text);
      weight.add([]);
      reps.add([]);
      for (int j = 0; j < widget.exercises[i].sets.length; j++) {
        weight[i]
            .add(int.parse(widget.exercises[i].sets[j].weightController.text));
        reps[i].add(int.parse(widget.exercises[i].sets[j].repsController.text));
      }
    }
    Plan plan = new Plan(
        planName: workoutName,
        exerciseNames: exerciseNames,
        weight: weight,
        reps: reps);
    print(plan.planName);
    print(plan.exerciseNames);
    print(plan.weight);
    print(plan.reps);
    return plan;
  }
}
