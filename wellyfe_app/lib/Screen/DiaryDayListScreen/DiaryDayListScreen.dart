import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/Body.dart';

class DiaryDayListScreen extends StatelessWidget {
  const DiaryDayListScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
