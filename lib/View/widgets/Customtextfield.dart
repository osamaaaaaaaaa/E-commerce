import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String hint;
  Customtextfield({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hint, border: OutlineInputBorder()),
    );
  }
}
