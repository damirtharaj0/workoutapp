import 'package:flutter/material.dart';

class ExerciseTextField extends StatelessWidget {

  TextEditingController controller;

  ExerciseTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      textAlign: TextAlign.center,
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Exercise Name",
      ),
    );
  }
}