import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/GraphContainer.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopLevelBar(),
              SizedBox(height: size.height * 0.001),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                child: Column(
                  children: [
                    GraphContainer(
                      isBubble: true,
                      title: "Priority",
                    ),
                    SizedBox(height: size.height * 0.03),
                    GraphContainer(
                      isBubble: false,
                      title: "Activity",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
