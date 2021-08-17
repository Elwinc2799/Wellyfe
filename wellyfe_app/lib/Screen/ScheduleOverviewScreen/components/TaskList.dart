import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(TaskData.taskDataList.length, (index) {
          return Task(task: TaskData.taskDataList[index].taskName);
        }),
      ),
    );
  }
}
