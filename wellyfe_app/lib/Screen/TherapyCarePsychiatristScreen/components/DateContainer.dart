import 'package:flutter/material.dart';

class DateContainer extends StatefulWidget {
  @override
  _DateContainerState createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        height: 75,
        width: 50,
        child: Column(
          children: [
            Text(
              "16",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
