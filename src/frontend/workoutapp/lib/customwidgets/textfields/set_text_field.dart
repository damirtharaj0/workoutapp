import 'package:flutter/material.dart';

class SetTextField extends StatelessWidget {
  TextEditingController controller;

  SetTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: false,
          enabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(),
        ));
  }
}