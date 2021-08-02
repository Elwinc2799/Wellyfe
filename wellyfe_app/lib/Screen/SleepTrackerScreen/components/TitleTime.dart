import 'package:flutter/material.dart';

class TitleTime extends StatelessWidget {
  const TitleTime({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w800,
            fontFamily: "Nunito",
            fontSize: 25,
          ),
        ),
        Text(
          time,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: "Nunito",
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
