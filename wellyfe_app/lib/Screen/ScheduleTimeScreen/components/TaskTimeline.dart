import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/PriorityTitleStatus.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/Timeline.dart';

class TaskTimeline extends StatelessWidget {
  const TaskTimeline({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = task.findColor();

    return Container(
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Timeline(
            startTime: task.timeUtilityFunction(task.startTime),
            endTime: task.timeUtilityFunction(task.endTime),
          ),
          SizedBox(width: size.width * 0.055),
          GlassmorphicContainer(
            height: size.height * 0.125,
            width: size.width * 0.675,
            border: 2.5,
            borderRadius: 10,
            blur: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.05),
                color.withOpacity(0.35),
              ],
              stops: [
                0.1,
                1,
              ]
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFFFFF).withOpacity(0.25),
                Color(0xFFFFFFFF).withOpacity(0.75),
              ],
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
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                PriorityTitleStatus(
                  priority: task.priorityConversion(),
                  title: task.taskName,
                  status: task.taskCategory,
                  color: task.findColor(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}