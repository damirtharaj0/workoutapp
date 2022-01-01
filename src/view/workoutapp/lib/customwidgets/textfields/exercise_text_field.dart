import 'package:flutter/material.dart';

class ExerciseTextField extends StatelessWidget {

  TextEditingController controller;

  ExerciseTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: "Exercise Name",
      ),
    );
  }
}