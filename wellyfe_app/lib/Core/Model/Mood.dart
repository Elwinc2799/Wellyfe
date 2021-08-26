import 'package:flutter/material.dart';
import 'package:darq/darq.dart';

class Mood {
  final String moodID;
  final String mood;
  final DateTime date;

  Mood(
    this.moodID,
    this.mood,
    this.date
  );

  static List<Mood> moodDataList = [];

  static Color getMoodColor(String mood) {
    if (mood == "awesome")
      return Color(0XFFFFCF30);
    else if (mood == "great")
      return Color(0XFFB3CFFF);
    else return Color(0XFF7CE1FF);
  }

  static List<Mood> getMonthList() {
    var distinct = moodDataList.distinct(
        (element) => element.date.month
    ).toList();

    return distinct;
  }

  static List<Mood> getMonthlyMoodList(int month) {
    return moodDataList.where(
        (element) => (element.date.month == month)
    ).toList();
  }
}