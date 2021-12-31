import 'package:flutter/material.dart';

class ExerciseTextField extends StatelessWidget {

  UniqueKey key;

  ExerciseTextField({required this.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      decoration: InputDecoration(
        hintText: "Exercise Name",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        )
      ),
    );
  }
}