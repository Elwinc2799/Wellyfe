import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/MidLevelBar.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/ScheduleMenu.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Task.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TaskList.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopLevelBar(),
          SizedBox(height: size.height * 0.075),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                ScheduleMenu(),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      MidLevelBar(),
                      SizedBox(height: size.height * 0.025),
                      TaskList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
