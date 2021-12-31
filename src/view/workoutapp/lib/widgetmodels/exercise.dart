import 'package:flutter/material.dart';
import 'package:view/customwidgets/textfields/exercise_text_field.dart';
import 'set.dart';

class Exercise extends StatefulWidget {
  UniqueKey exerciseKey = new UniqueKey();
  List<Set> sets = [
    Set(index: 0)];
  TextEditingController exerciseController = new TextEditingController();

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: show()));
  }

  List<Widget> show() {
    List<Widget> build = [];

    build.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ExerciseTextField(
          key: widget.exerciseKey,
          controller: widget.exerciseController,
        )));
    build.add(Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [Text("Set#"), Text("LBS"), Text("Reps")],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    ));
    for (int i = 0; i < widget.sets.length; i++) {
      build.add(
        Dismissible(
          child: widget.sets[i],
          onDismissed: (left) {
            setState(() {
              widget.sets.removeAt(i);
              for(int j = 0; j < widget.sets.length; j++) {
                widget.sets[j].index = j;
              }
            });
          }, key: UniqueKey(),
        )
      );
    }
    build.add(ElevatedButton(
      child: Text("Add Set"),
      onPressed: () {
        setState(() {
          widget.sets.add(Set(index: widget.sets.length));
        });
      },
    ));
    return build;
  }
}
