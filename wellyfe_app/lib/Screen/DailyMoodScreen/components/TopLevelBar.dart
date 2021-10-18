import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30.0, 10, 0),
        child: Text(
          "How are you feeling today?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
