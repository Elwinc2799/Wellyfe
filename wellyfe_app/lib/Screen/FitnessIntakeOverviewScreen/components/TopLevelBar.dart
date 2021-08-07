import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Calorie Plan",
          style: TextStyle(
            fontSize: 35,
            fontFamily: "NunitoSans",
            color: Color(0XFF394D70),
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFF4F9FF),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-3, -3),
                      color: Colors.grey.withOpacity(0.1)
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