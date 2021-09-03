import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/ScheduleNewTask.dart';


class MidLevelBar extends StatefulWidget {
  @override
  _MidLevelBarState createState() => _MidLevelBarState();
}

class _MidLevelBarState extends State<MidLevelBar> {
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
            color: Color(0XFF394D70),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, PageTransition(
              type: PageTransitionType.fade,
              child: ScheduleNewTask(),
            ));
          },
          child: Text(
            "Add new task",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF9C7EFD),
            ),
          ),
        )
      ],
    );
  }
}
