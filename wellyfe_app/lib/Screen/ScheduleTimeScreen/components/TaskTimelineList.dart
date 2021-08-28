import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimeline.dart';

class TaskTimelineList extends StatefulWidget {
  @override
  _TaskTimelineListState createState() => _TaskTimelineListState();

  static ValueNotifier<List<Task>> taskDataList = ValueNotifier(Task.newTaskDataList);

  static void listChanged() {
    taskDataList.value = Task.newTaskDataList;
  }
}

class _TaskTimelineListState extends State<TaskTimelineList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder<List<Task>>(
      valueListenable: TaskTimelineList.taskDataList,
      builder: (BuildContext context, List<Task> list, Widget? children) {
        return TaskTimelineList.taskDataList.value.isNotEmpty
            ? Column(
                children: List.generate(TaskTimelineList.taskDataList.value.length, (i) {
                  return Column(
                    children: [
                      TaskTimeline(
                        title: TaskTimelineList.taskDataList.value[i].taskName,
                        status: TaskTimelineList.taskDataList.value[i].taskCategory,
                        priority: TaskTimelineList.taskDataList.value[i].priorityConversion(),
                        startTime: TaskTimelineList.taskDataList.value[i].timeUtilityFunction(TaskTimelineList.taskDataList.value[i].startTime),
                        endTime: TaskTimelineList.taskDataList.value[i].timeUtilityFunction(TaskTimelineList.taskDataList.value[i].endTime),
                        color: TaskTimelineList.taskDataList.value[i].findColor(),
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
                      height: size.height * 0.35,
                      child: Image(image: AssetImage("assets/pictures/empty.png"))
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "You don't have any schedule on that day.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "NunitoSans",
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF344460),
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
