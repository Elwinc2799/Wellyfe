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

  static List<Task> taskDataList = [

  ];

  static List<Task> newTaskDataList = updateTaskDataList("Mo");

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

  static int countTaskStatus(String element) {
    var foundElements = taskDataList.where((e) => (e.taskCategory == element));
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

  static List<Task> updateTaskDataList(String date) {
    DateTime now = DateTime.now();
    DateTime initialDay = now.subtract(Duration(days: now.weekday));
    DateTime displaceDay = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
    DateTime firstDayOfWeek = new DateTime(
      initialDay.year,
      initialDay.month,
      initialDay.day
    );
    DateTime lastDayOfWeek = new DateTime(
      displaceDay.year,
      displaceDay.month,
      displaceDay.day,
    );

    newTaskDataList = [];

    for (var i = 0; i < taskDataList.length; i++) {
      if (DateFormat('EEEE').format(taskDataList[i].dueDate).substring(0, 2) == date)
        if (taskDataList[i].dueDate.isAfter(firstDayOfWeek) && taskDataList[i].dueDate.isBefore(lastDayOfWeek))
          newTaskDataList.add(taskDataList[i]);
    }

    return newTaskDataList;
  }

  static List<Task> getWeeklyTaskList() {
    DateTime now = DateTime.now();
    DateTime initialDay = now.subtract(Duration(days: now.weekday));
    DateTime displaceDay = now.add(Duration(days: DateTime.daysPerWeek - now.weekday + 1));
    DateTime firstDayOfWeek = new DateTime(
        initialDay.year,
        initialDay.month,
        initialDay.day
    );
    DateTime lastDayOfWeek = new DateTime(
      displaceDay.year,
      displaceDay.month,
      displaceDay.day,
    );

    newTaskDataList = [];

    for (var i = 0; i < taskDataList.length; i++) {
      if (taskDataList[i].dueDate.isAfter(firstDayOfWeek) && taskDataList[i].dueDate.isBefore(lastDayOfWeek))
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



}