import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Sleep.dart';
import 'package:wellyfe_app/Core/Model/UserProfile.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/GoalsContainer.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/MidLevelBar.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/StatsContainerLower.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/StatsContainerUpper.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/TrackingContainer.dart';

class Body extends StatelessWidget {

  Future<bool> _onWillPop() async {
    Sleep.sleepDataList = [];
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Background(
        children: Padding(
          padding: const EdgeInsets.fromLTRB(40, 70, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopLevelBar(
                name: UserProfile.userDetails.name,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                DateFormat('EEEE, d MMM y').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w900,
                  color: Color(0XFF585867),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Container(
                width: size.width,
                height: size.height * 0.23,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        TrackingContainer(),
                        SizedBox(width: 20),
                        GoalsContainer(),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: size.height * 0.025),
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
      ),
    );
  }
}

