import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/Body.dart';

class DiaryDayListScreen extends StatelessWidget {
  const DiaryDayListScreen({
    Key? key,
    required this.diaryList,
    required this.month,
  }) : super(key: key);

  final List<Diary> diaryList;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        diaryList: diaryList,
        month: month,
      ),
    );
  }
}
