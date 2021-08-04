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
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: name + "!",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Color(0XFF394D70),
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0XFFE1E2EB),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(-3, -3),
                    color: Colors.white
                ),
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(3, 3),
                    color: Colors.black.withOpacity(.25)
                )
              ]
            ),
            child: Center(
              child: Image(image: AssetImage("assets/logo/menu.png"))
            )
          )
        )
      ],
    );
  }
}