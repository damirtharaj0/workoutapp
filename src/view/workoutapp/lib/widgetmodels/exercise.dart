import 'package:flutter/material.dart';
import '../customwidgets/exercise_text_field.dart';
import 'set.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  UniqueKey exerciseKey = new UniqueKey();
  List sets = [Set(index: 0)];

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: show()));
  }

  List<Widget> show() {
    List<Widget> build = [];

    build.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExerciseTextField(
        key: exerciseKey,
      ),
    ));
    build.add(Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [Text("Set#"), Text("LBS"), Text("Reps")],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    ));
    for (int i = 0; i < sets.length; i++) {
      build.add(sets[i]);
    }
    build.add(ElevatedButton(
      child: Text("Add Set"),
      onPressed: () {
        setState(() {
          sets.add(Set(index: sets.length));
        });
      },
    ));

    return build;
  }
}
