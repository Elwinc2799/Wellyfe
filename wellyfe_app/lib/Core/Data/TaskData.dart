import 'package:flutter/material.dart';

class TaskData {
  TaskData(
    this.taskName,
    this.taskPriority,
    this.dateTime,
    this.isDone,
  );

  final String taskName;
  final int taskPriority;
  final DateTime dateTime;
  final bool isDone;

  Color findColor() {
    var color;

    switch(this.taskPriority) {
      case 1:
        color = Color(0XFF1CB3B2);
        break;

      case 2:
        color = Color(0XFF8677FE);
        break;

      case 3:
        color = Color(0XFFFB5A7E);
        break;
    }

    return color;
  }
}