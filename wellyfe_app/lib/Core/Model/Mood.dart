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
  static String moodOfToday = "";

  static Color getMoodColor(String mood) {
    if (mood == "Awful")
      return Color(0XFFD4B2D8);
    else if (mood == "Sad")
      return Color(0XFFFCBDE9);
    else if (mood == "OK")
      return Color(0XFFFFCDB2);
    else if (mood == "Happy" || mood == "great")
      return Color(0XFFF8ECBD);
    else return Color(0XFFBCFBE4);
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