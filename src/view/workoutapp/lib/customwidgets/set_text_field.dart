import 'package:flutter/material.dart';

class SetTextField extends StatelessWidget {
  UniqueKey key = new UniqueKey();

  SetTextField({required this.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: key,
        decoration: InputDecoration(
          filled: false,
          enabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(),
        ));
  }
}
