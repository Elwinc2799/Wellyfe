import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/ScheduleMenu.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopLevelBar(),
        SizedBox(height: size.height * 0.075),
        ScheduleMenu(),
      ],
    );
  }
}
