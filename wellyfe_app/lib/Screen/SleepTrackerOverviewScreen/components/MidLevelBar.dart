import 'package:flutter/material.dart';

class MidLevelBar extends StatelessWidget {
  const MidLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Statistics",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w900,
            color: Colors.white.withOpacity(0.75),
          ),
        ),
        Text(
          "See all",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w900,
            color: Color(0XFF585867),
          ),
        ),
      ],
    );
  }
}