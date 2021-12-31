import 'package:flutter/material.dart';
import 'package:view/customwidgets/set_text_field.dart';

class Set extends StatelessWidget {
  UniqueKey setKey = new UniqueKey();
  late int index;

  Set({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(child: Center(child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: SetTextField(
              key: setKey,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: SetTextField(key: setKey),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ));
  }
}
