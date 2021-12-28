import 'package:flutter/material.dart';

class Exercise {
  var exerciseName;
  var weight;
  var reps;
  var exerciseKey;
  List<UniqueKey> setKeys = [];
  List<Widget> build = [];

  Exercise(BuildContext context) {
    this.exerciseKey = new UniqueKey();
    addExercise();
    addSet();
  }

  void addExercise() {
    this.build.add(TextField(
          textAlign: TextAlign.center,
          key: this.exerciseKey,
          decoration: InputDecoration(hintText: "Exercise Name"),
        ));
    this.build.add(Row(
          children: [Text("Set #"), Text("Reps"), Text("Lbs")],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
    this.build.add(ElevatedButton(
        onPressed: () {
          
        },
        child: Text("Add Set")));
  }

  get getBuild {
    return this.build;
  }

  void addSet() {
    UniqueKey setKey = new UniqueKey();
    setKeys.add(setKey);
    build.add(Row(
      children: [
        Container(
          height: 20,
          width: 20,
          child: TextField(),
        ),
        Container(
          height: 20,
          width: 20,
          child: TextField(),
        )
      ],
    ));
  }
}
