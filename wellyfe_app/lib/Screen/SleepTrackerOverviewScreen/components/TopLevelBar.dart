import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: "Hey, ",
              style: TextStyle(
                fontFamily: "Nunito",
                color: Color(0XFF394D70),
                fontSize: 27.5,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: name + "!",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Color(0XFF394D70),
                    fontSize: 27.5,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]
          ),
        ),
      ],
    );
  }
}