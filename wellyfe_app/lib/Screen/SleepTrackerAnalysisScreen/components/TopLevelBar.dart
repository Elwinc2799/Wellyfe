import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "L I F E S T Y L E",
          style: TextStyle(
            fontFamily: "Nunito",
            color: Color(0XFF394D70),
            fontSize: 25,
            fontWeight: FontWeight.w900,
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
                      color: Colors.grey.withOpacity(0.1),
                  ),
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                      color: Colors.black.withOpacity(.25)
                  )
                ]
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 30,
                color: Color(0XFF394D70),
              ),
            ),
          ),
        )
      ],
    );
  }
}