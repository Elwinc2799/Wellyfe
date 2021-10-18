import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TaskIndividual.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> weeklyTaskList = Provider.of<TaskProvider>(context).taskList;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(weeklyTaskList.length, (index) {
          return TaskIndividual(
            task: weeklyTaskList[index].taskName,
            isDone: weeklyTaskList[index].isDone,
          );
        }),
      ),
    );
  }
}
