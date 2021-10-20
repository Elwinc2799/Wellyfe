import 'package:flutter/cupertino.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';

class DiaryProvider extends ChangeNotifier {
  late List<Diary> _diaryList;
  late List<Diary> _monthlyDiaryList;
  late Diary _diary;

  List<Diary> get diaryList => _diaryList;
  List<Diary> get monthlyDiaryList => _monthlyDiaryList;
  Diary get diary => _diary;

  void setDiaryList(List<Diary> diaryList) {
    _diaryList = diaryList;
    notifyListeners();
  }

  void setMonthlyDiaryList(List<Diary> monthlyDiaryList) {
    _monthlyDiaryList = monthlyDiaryList;

    notifyListeners();
  }

  void setDiary(Diary diary) {
    _diary = diary;
    notifyListeners();
  }

  void addNewDiary(Diary diary) {
    _diaryList.add(diary);
    notifyListeners();
  }

  int getFavourite() {
    return _diaryList.where(
        (element) => (element.favourite == true)
    ).toList().length;
  }

  Map<dynamic, dynamic> getWeatherOccurrence() {
    var map = Map();

    _diaryList.forEach(
      (element) => map[element.weather] = !map.containsKey(element.weather) ? (1) : (map[element.weather] + 1)
    );

    return map;
  }

  Map<dynamic, dynamic> getMoodOccurrence() {
    var map = Map();

    _diaryList.forEach(
      (element) => map[element.mood] = !map.containsKey(element.mood) ? (1) : (map[element.mood] + 1)
    );

    return map;
  }
}