import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/ScheduleNewTask.dart';

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
            color: Color(0XFFB1BDD3),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ScheduleNewTask();
                }
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