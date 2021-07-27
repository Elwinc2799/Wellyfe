import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TaskList.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 5.0),
        child: TaskList(),
      ),
      decoration: BoxDecoration(
          color: Color(0XFFEDF1F4),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
    );
  }
}