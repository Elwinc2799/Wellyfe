import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/WordCount.dart';

class ScatterItem extends StatelessWidget {
  final String word;
  final double size;
  final bool rotate;

  const ScatterItem({
    Key? key,
    required this.word,
    required this.size,
    required this.rotate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lastIndex = WordCount.wordCloud.length - 1;
    double fontSize = (size / WordCount.wordCloud.values.elementAt(lastIndex)) * 175;

    Color getColor(double category) {
      if (category >= 100)
        return Color(0XFF44CCFF);
      else if (category >= 75 && category < 100)
        return Color(0XFF92A0E0);
      else if (category > 30 && category < 75)
        return Color(0XFF44CCFF).withOpacity(0.75);

    return Color(0XFF92A0E0).withOpacity(0.75);
    }

    return RotatedBox(
      quarterTurns: rotate ? 1 : 0,
      child: Text(
        (word == "i") ? word.toUpperCase() : word.toLowerCase(),
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: "Montserrat",
          color: getColor(fontSize),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}