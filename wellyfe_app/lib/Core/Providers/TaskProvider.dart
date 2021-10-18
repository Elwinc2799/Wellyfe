import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';

class TaskProvider extends ChangeNotifier {
  late List<Task> _taskList;
  late List<Task> _dailyTaskList;

  List<Task> get taskList => _taskList;
  List<Task> get dailyTaskList => _dailyTaskList;

  void setTaskList(List<Task> taskList) {
    _taskList = taskList;
    notifyListeners();
  }

  int countTaskStatus(String element) {
    var foundElements = _taskList.where((e) => (e.taskCategory == element));
    return foundElements.length;
  }

  void setDailyTaskList(String date) {
    List<Task> dailyTaskList = [];

    _taskList.forEach((element) {
      if (DateFormat('EEEE').format(element.dueDate).substring(0, 2) == date)
        dailyTaskList.add(element);
    });

    _dailyTaskList = dailyTaskList;
    notifyListeners();
  }

  void addNewTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }
}