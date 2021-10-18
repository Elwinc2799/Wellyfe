import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/ScheduleOverviewScreen.dart';
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
            Provider
              .of<TaskProvider>(context, listen: false)
              .setDailyTaskList("Mo");

            Navigator.pushReplacement(context, PageTransition(
                type: PageTransitionType.fade,
                child: ScheduleTimeScreen(),
              ),
            );
          },
        ),
        Text(
          DateFormat('EEEE, d MMM').format(date),
          style: TextStyle(
            fontSize: 20,
            fontFamily: "NunitoSans",
            color: Color(0XFF394D70),
            fontWeight: FontWeight.w700,
          ),
        ),
        TopLevelIcon(
          asset: "assets/logo/home.png",
          function: () {
            Navigator.pushReplacement(context, PageTransition(
              type: PageTransitionType.fade,
              child: ScheduleOverviewScreen(),
            ));
          },
        ),
      ],
    );
  }
}