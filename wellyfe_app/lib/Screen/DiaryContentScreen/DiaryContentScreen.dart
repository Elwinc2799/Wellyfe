import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/components/Body.dart';

class DiaryContentScreen extends StatelessWidget {

  const DiaryContentScreen({
    Key? key,
    required this.diary
  }) : super(key: key);

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        diary: diary,
      ),
    );
  }
}
