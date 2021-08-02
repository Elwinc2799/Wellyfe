import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitleDataMonth extends StatelessWidget {
  const TitleDataMonth({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final String data;

  String getDataUnit(String title) {
    if (title.substring(6, 7) == 'T')
      return "Hr";
    return "St";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              data + ' ' + getDataUnit(title),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              DateFormat('MMMM').format(DateTime.now()),
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}