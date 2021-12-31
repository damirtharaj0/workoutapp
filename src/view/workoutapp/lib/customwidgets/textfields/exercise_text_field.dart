import 'package:flutter/material.dart';

class ExerciseTextField extends StatelessWidget {

  UniqueKey key;
  TextEditingController controller;

  ExerciseTextField({required this.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      key: key,
      decoration: InputDecoration(
        hintText: "Exercise Name",
      ),
    );
  }
}