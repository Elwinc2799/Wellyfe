import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Sleep.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/MidLevelBar.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/StatsContainerLower.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/StatsContainerUpper.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/TrackingContainer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(
              name: "Gigi",
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              DateFormat('EEEE, d MMM y').format(DateTime.now()),
              style: TextStyle(
                fontSize: 22.5,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF585867),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            TrackingContainer(),
            SizedBox(height: size.height * 0.035),
            MidLevelBar(),
            SizedBox(height: size.height * 0.025),
            Column(
              children: [
                StatsContainerUpper(),
                SizedBox(height: size.height * 0.025),
                StatsContainerLower(),
              ],
            )
          ],
        ),
      )
    );
  }
}

