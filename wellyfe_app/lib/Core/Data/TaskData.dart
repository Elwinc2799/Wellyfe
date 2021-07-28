import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskData {
  TaskData(
    this.taskName,
    this.taskPriority,
    this.dateTime,
    this.isDone,
    this.status,
  );

  final String taskName;
  final int taskPriority;
  final DateTime dateTime;
  final bool isDone;
  final status;

  Color findColor() {
    switch(this.taskPriority) {
      case 1:
        return Color(0XFF1CB3B2);
      case 2:
        return Color(0XFF8677FE);
      case 3:
        return Color(0XFFFB5A7E);
    }

    return Color(0xFFFFFFFF);
  }

  int countDateOccurrences(List<TaskData> list, int element, DateTime dateTime) {
    if (list.isEmpty)
      return 0;

    var foundElements = list.where((e) => (e.taskPriority == element && e.dateTime == dateTime));
    return foundElements.length;
  }

  int countDateOnlyOccurrences(List<TaskData> list, String date) {
    if (list.isEmpty)
      return 0;

    var foundElements = list.where((e) => (DateFormat('EEEE').format(e.dateTime).substring(0, 3) == date));
    return foundElements.length;
  }

  int switchOccurrences(List<TaskData> list) {
    switch(this.taskPriority) {
      case 1:
        return countDateOccurrences(list, 1, this.dateTime);
      case 2:
        return countDateOccurrences(list, 2, this.dateTime);
      case 3:
        return countDateOccurrences(list, 3, this.dateTime);
    }

    return -1;
  }

  int switchDateOccurrences(List<TaskData> list) {
    var date = DateFormat('EEEE').format(this.dateTime).substring(0, 3);

    switch(date) {
      case "Mon":
        return countDateOnlyOccurrences(list, date);
      case "Tue":
        return countDateOnlyOccurrences(list, date);
      case "Wed":
        return countDateOnlyOccurrences(list, date);
      case "Thu":
        return countDateOnlyOccurrences(list, date);
      case "Fri":
        return countDateOnlyOccurrences(list, date);
      case "Sat":
        return countDateOnlyOccurrences(list, date);
      case "Sun":
        return countDateOnlyOccurrences(list, date);
    }

    return -1;
  }
}