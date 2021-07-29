import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimeline.dart';

class TaskTimelineList extends StatefulWidget {
  @override
  _TaskTimelineListState createState() => _TaskTimelineListState();

  static ValueNotifier<List<TaskData>> taskDataList = ValueNotifier(TaskData.newTaskDataList);

  static void listChanged() {
    taskDataList.value = TaskData.newTaskDataList;
  }
}

class _TaskTimelineListState extends State<TaskTimelineList> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder<List<TaskData>>(
      valueListenable: TaskTimelineList.taskDataList,
      builder: (BuildContext context, List<TaskData> list, Widget? children) {
        return Column(
          children: [
            for (var i = 0; i < TaskTimelineList.taskDataList.value.length; i++)
              Column(
                children: [
                  TaskTimeline(
                    title: TaskTimelineList.taskDataList.value[i].taskName,
                    status: TaskTimelineList.taskDataList.value[i].status,
                    priority: TaskTimelineList.taskDataList.value[i].priorityConversion(),
                    startTime: TaskTimelineList.taskDataList.value[i].timeUtilityFunction(TaskTimelineList.taskDataList.value[i].dateTime.hour),
                    endTime: TaskTimelineList.taskDataList.value[i].timeUtilityFunction(TaskTimelineList.taskDataList.value[i].dateTime.hour + 1),
                    color: TaskTimelineList.taskDataList.value[i].findColor(),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
          ],
        );
      },
    );
  }
}
