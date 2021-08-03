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
                color: Color(0XFFC1BCE5),
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: name + "!",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Color(0XFFF0EEFF),
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]
          ),
        ),
        Image(image: AssetImage("assets/logo/menu.png"))
      ],
    );
  }
}