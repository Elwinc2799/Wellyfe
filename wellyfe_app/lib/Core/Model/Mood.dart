import 'package:flutter/material.dart';

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
}