import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/components/AwakeAsleepContainer.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/components/SleepLevelBarChart.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            SleepLevelBarChart(),
            SizedBox(height: size.height * 0.04),
            AwakeAsleepContainer(),
          ],
        ),
      ),
    );
  }
}

