import 'package:flutter/material.dart';

class LegendIndividual extends StatelessWidget {
  const LegendIndividual({
    Key? key,
    required this.color,
    required this.priority,
  }) : super(key: key);

  final Color color;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.5),
          child: Container(
            height: 7,
            width: 7,
            decoration: new BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(
          priority,
          style: TextStyle(
            fontSize: 12.5,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.w800,
            color: Color(0XFF344460).withOpacity(0.7),
          ),
        )
      ],
    );
  }
}