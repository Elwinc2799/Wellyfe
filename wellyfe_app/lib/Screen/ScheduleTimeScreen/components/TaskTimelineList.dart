import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimeline.dart';

class TaskTimelineList extends StatefulWidget {
  @override
  _TaskTimelineListState createState() => _TaskTimelineListState();

}

class _TaskTimelineListState extends State<TaskTimelineList> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Task> taskDataList = Provider.of<TaskProvider>(context).dailyTaskList;

    return taskDataList.isNotEmpty
      ? Column(
          children: List.generate(taskDataList.length, (i) {
            return Column(
              children: [
                TaskTimeline(
                  task: taskDataList[i],
                ),
                SizedBox(height: size.height * 0.03),
              ],
            );
          }),
        )
      : Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.37,
                child: Image(image: AssetImage("assets/pictures/empty.png"))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "You don't have any schedule on that day.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF344460),
                  ),
                ),
              )
            ],
          ),
        );
  }
}
