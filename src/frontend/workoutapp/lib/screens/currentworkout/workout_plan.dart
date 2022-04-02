import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/widgetmodels/exercise.dart';
import 'package:http/http.dart' as http;

class WorkoutPlan extends StatefulWidget {
  List<Exercise> exercises = [Exercise()];
  // List pageBuild = [];
  TextEditingController workoutNameController = new TextEditingController();

  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    List pageBuild = buildPage();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: false,
          textCapitalization: TextCapitalization.words,
          controller: widget.workoutNameController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: "Workout Name",
          ),
        ),
      ),
      ),
      body: ListView.builder(
        itemCount: pageBuild.length,
        itemBuilder: (BuildContext context, int index) {
          return pageBuild[index];
        },
      ),
    );
  }

  List<Widget> buildPage() {
    List<Widget> pageBuild = [];

    for (int i = 0; i < widget.exercises.length; i++) {
      pageBuild.add(Dismissible(
        child: widget.exercises[i],
        onDismissed: (left) {
          setState(() {
            widget.exercises.removeAt(i);
          });
        },
        key: UniqueKey(),
      ));
    }

    pageBuild.add(ElevatedButton(
        child: Text("Add Exercise"),
        onPressed: () {
          setState(() {
            widget.exercises.add(Exercise());
          });
        }));

    pageBuild.add(ElevatedButton(
      child: Text("Finish Workout"),
      onPressed: () {
        Plan plan = makeClass();
        postData(plan);
        Navigator.pop(context);
      },
    ));
    pageBuild.add(ElevatedButton(
      child: Text("Cancel Workout"),
      onPressed: () {
        Navigator.pop(context);
      },
    ));
    return pageBuild;
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

  void postData(Plan plan) async {
    var response = await http.post(
      Uri.parse("https://flask-backend.dannyaam9.repl.co/addPlan"),
      body: json.encode(plan.toJson()),
      headers: {
        "Content-Type" : "application/json"
      }
    );
    print(response.statusCode);
  }
}
