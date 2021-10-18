import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task{
  final String taskID;
  final String taskName;
  final int taskPriority;
  String taskCategory;
  final DateTime dueDate;
  final int startTime;
  final int endTime;
  bool isDone;

  Task(
    this.taskID,
    this.taskName,
    this.taskPriority,
    this.taskCategory,
    this.dueDate,
    this.startTime,
    this.endTime,
    this.isDone,
  );

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

  int countDateOccurrences(List<Task> list, int element, DateTime dateTime) {
    if (list.isEmpty)
      return 0;

    var foundElements = list.where((e) => (e.taskPriority == element && e.dueDate == dateTime));
    return foundElements.length;
  }

  int countDateOnlyOccurrences(List<Task> list, String date) {
    if (list.isEmpty)
      return 0;

    var foundElements = list.where((e) => (DateFormat('EEEE').format(e.dueDate).substring(0, 3) == date));
    return foundElements.length;
  }

  int switchOccurrences(List<Task> list) {
    switch(this.taskPriority) {
      case 1:
        return countDateOccurrences(list, 1, this.dueDate);
      case 2:
        return countDateOccurrences(list, 2, this.dueDate);
      case 3:
        return countDateOccurrences(list, 3, this.dueDate);
    }

    return -1;
  }

  int switchDateOccurrences(List<Task> list) {
    var date = DateFormat('EEEE').format(this.dueDate).substring(0, 3);
    return countDateOnlyOccurrences(list, date);
  }

  String timeConversion(int hour) {
    if (hour < 10)
      return "0" + hour.toString();
    return hour.toString();
  }

  String priorityConversion() {
    switch(this.taskPriority) {
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
    if (time == 12)
      return timeConversion(time) + " PM";
    else if (time < 12)
      return timeConversion(time) + " AM";
    else
      return timeConversion(time - 12) + " PM";
  }
}