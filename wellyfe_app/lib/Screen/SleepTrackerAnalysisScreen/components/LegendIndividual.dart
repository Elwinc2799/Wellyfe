import 'package:flutter/material.dart';

class LegendIndividual extends StatelessWidget {
  const LegendIndividual({
    Key? key,
    required this.color,
    required this.indicator,
  }) : super(key: key);

  final Color color;
  final String indicator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 10,
            width: 10,
            decoration: new BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(
          indicator,
          style: TextStyle(
            fontSize: 17.5,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.w800,
            color: Color(0XFF344460).withOpacity(0.7),
          ),
        )
      ],
    );
  }
}