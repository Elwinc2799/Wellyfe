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

  static List<TaskData> taskDataList = [
    TaskData("Testing 1", 1, DateTime.utc(2021, DateTime.july, 26, 10), false, "Ongoing"),
    TaskData("Testing 5", 1, DateTime.utc(2021, DateTime.july, 26, 11), false, "Ongoing"),
    TaskData("2", 2, DateTime.utc(2021, DateTime.july, 26, 12), false, "Ongoing"),
    TaskData("Testing 5", 3, DateTime.utc(2021, DateTime.july, 26, 13), false, "Ongoing"),
    TaskData("Testing 3", 3, DateTime.utc(2021, DateTime.july, 26, 14), false, "Ongoing"),
    TaskData("Testing 4", 3, DateTime.utc(2021, DateTime.july, 26, 15), false, "Ongoing"),
    TaskData("Testing 6", 1, DateTime.utc(2021, DateTime.july, 26, 16), false, "Ongoing"),
    TaskData("Testing 7", 1, DateTime.utc(2021, DateTime.july, 26, 17), false, "Ongoing"),
    TaskData("Testing 7", 1, DateTime.utc(2021, DateTime.july, 27, 17), false, "Ongoing"),
    TaskData("Testing 1", 1, DateTime.utc(2021, DateTime.july, 26), false, "Ongoing"),
    TaskData("Testing 5", 1, DateTime.utc(2021, DateTime.july, 26), false, "Ongoing"),
    TaskData("Testing 5", 3, DateTime.utc(2021, DateTime.july, 27), false, "Ongoing"),
    TaskData("Testing 2", 2, DateTime.utc(2021, DateTime.july, 28), false, "Ongoing"),
    TaskData("Testing 3", 3, DateTime.utc(2021, DateTime.july, 29), false, "Ongoing"),
    TaskData("Testing 4", 3, DateTime.utc(2021, DateTime.july, 30), false, "Ongoing"),
    TaskData("Testing 6", 1, DateTime.utc(2021, DateTime.july, 31), false, "Ongoing"),
    TaskData("Testing 7", 1, DateTime.utc(2021, DateTime.july, 25), false, "Ongoing"),
  ];

  static List<TaskData> newTaskDataList = updateTaskDataList("Mo");

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

  static List<TaskData> updateTaskDataList(String date) {
    newTaskDataList = [];

    for (var i = 0; i < taskDataList.length; i++) {
      if (DateFormat('EEEE').format(taskDataList[i].dateTime).substring(0, 2) == date)
        newTaskDataList.add(taskDataList[i]);
    }

    return newTaskDataList;
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

  // static bool listGotHighPriority(List<TaskData> list) {
  //   final found = list.where((element) => element.taskPriority == 3);
  //
  //   if (found.isNotEmpty)
  //     return true;
  //   return false;
  // }
}