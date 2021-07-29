import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/ScheduleAnalysisScreen.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TopLevelIcon.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/ScheduleTimeScreen.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimelineList.dart';

class TopLevelBar extends StatelessWidget {
  TopLevelBar({
    Key? key,
  }) : super(key: key);

  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopLevelIcon(
          asset: "assets/logo/calendar.png",
          function: () {
            TaskData.updateTaskDataList("Mo");
            TaskTimelineList.listChanged();

            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return ScheduleTimeScreen();
              }
            ));
          },
        ),
        Text(
          DateFormat('EEEE, d MMM').format(date),
          style: TextStyle(
            fontSize: 30,
            fontFamily: "NunitoSans",
            color: Color(0XFFB1BDD3),
          ),
        ),
        TopLevelIcon(
          asset: "assets/logo/chart.png",
          function: () { Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return ScheduleAnalysisScreen();
              }
            ));
          },
        ),
      ],
    );
  }
}