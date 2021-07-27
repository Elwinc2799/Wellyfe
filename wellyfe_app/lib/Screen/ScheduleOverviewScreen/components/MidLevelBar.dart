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
          "Tasks",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.w800,
            color: Color(0XFF344460),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "View All",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF6692DF),
            ),
          ),
        )
      ],
    );
  }
}