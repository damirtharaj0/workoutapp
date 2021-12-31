import 'package:flutter/material.dart';

class SetTextField extends StatelessWidget {
  UniqueKey key;
  TextEditingController controller;

  SetTextField({required this.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        textAlign: TextAlign.center,
        key: key,
        decoration: InputDecoration(
          filled: false,
          enabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(),
        ));
  }
}