import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimeline.dart';

class TaskTimelineList extends StatelessWidget {
  TaskTimelineList({
    Key? key,
  }) : super(key: key);

  List<TaskData> taskDataList = [
    TaskData("Testing 1", 1, DateTime.utc(2021, DateTime.july, 26, 10), false, "Ongoing"),
    TaskData("Testing 5", 1, DateTime.utc(2021, DateTime.july, 26, 11), false, "Ongoing"),
    TaskData("2", 2, DateTime.utc(2021, DateTime.july, 26, 12), false, "Ongoing"),
    TaskData("Testing 5", 3, DateTime.utc(2021, DateTime.july, 26, 13), false, "Ongoing"),
    TaskData("Testing 3", 3, DateTime.utc(2021, DateTime.july, 26, 14), false, "Ongoing"),
    TaskData("Testing 4", 3, DateTime.utc(2021, DateTime.july, 26, 15), false, "Ongoing"),
    TaskData("Testing 6", 1, DateTime.utc(2021, DateTime.july, 26, 16), false, "Ongoing"),
    TaskData("Testing 7", 1, DateTime.utc(2021, DateTime.july, 26, 17), false, "Ongoing"),
  ];

  String timeConversion(int hour) {
    if (hour < 10)
      return "0" + hour.toString();
    return hour.toString();
  }

  String priorityConversion(int priority) {
    switch(priority) {
      case 1:
        return "Low";
      case 2:
        return "Medium";
      case 3:
        return "High";
    }

    return "";
  }

  String timeUtilityFunction(int time) {
    if (time < 12)
      return timeConversion(time) + " AM";
    else
      return timeConversion(time - 12) + " PM";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        for (var i = 0; i < taskDataList.length; i++)
          Column(
            children: [
              TaskTimeline(
                title: taskDataList[i].taskName,
                status: taskDataList[i].status,
                priority: priorityConversion(taskDataList[i].taskPriority),
                startTime: timeUtilityFunction(taskDataList[i].dateTime.hour),
                endTime: timeUtilityFunction(taskDataList[i].dateTime.hour + 1),
                color: taskDataList[i].findColor(),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
      ],
    );
  }
}