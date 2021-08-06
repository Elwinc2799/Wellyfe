import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "NunitoSans",
          fontWeight: FontWeight.bold,
          color: Color(0XFF394D70),
        ),
      ),
    );
  }
}