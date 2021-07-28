import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/ScheduleOverviewScreen.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TopLevelIcon.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/ScheduleTimeScreen.dart';

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
          function: () { Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return ScheduleTimeScreen();
              }
            ));
          },
        ),
        Text(
          DateFormat('EEEE, d MMM').format(date),
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            color: Color(0XFF344460),
          ),
        ),
        TopLevelIcon(
          asset: "assets/logo/home.png",
          function: () { Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return ScheduleOverviewScreen();
              }
            ));
          },
        ),
      ],
    );
  }
}