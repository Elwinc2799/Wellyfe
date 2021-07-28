import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            startTime,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.5),
            ),
          ),
          Text(
            endTime,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
