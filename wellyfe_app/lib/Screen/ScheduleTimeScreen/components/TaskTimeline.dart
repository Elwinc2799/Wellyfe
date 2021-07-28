import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/PriorityTitleStatus.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/Timeline.dart';

class TaskTimeline extends StatelessWidget {
  const TaskTimeline({
    Key? key,
    required this.title,
    required this.status,
    required this.priority,
    required this.startTime,
    required this.endTime,
    required this.color,
  }) : super(key: key);

  final String title;
  final String status;
  final String priority;
  final String startTime;
  final String endTime;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Timeline(
            startTime: startTime,
            endTime: endTime,
          ),
          SizedBox(width: size.width * 0.1),
          Container(
            height: size.height * 0.125,
            width: size.width * 0.65,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.125,
                  width: size.width * 0.05,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
                PriorityTitleStatus(
                  priority: priority,
                  title: title,
                  status: status,
                  color: color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}