import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> taskList = ["Testing 1", "Testing 2", "Testing 3", "Testing 4", "Testing 5"];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(taskList.length, (index) {
          return Task(task: taskList[index]);
        }),
      ),
    );
  }
}
