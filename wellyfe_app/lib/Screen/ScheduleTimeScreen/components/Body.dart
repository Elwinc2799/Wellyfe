import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/DaysList.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/MidLevelDivider.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimelineList.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "A G E N D A",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Color(0XFF394D70),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  DaysList(),
                  SizedBox(height: size.height * 0.03),
                  MidLevelDivider(),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    height: size.height * 0.475,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: TaskTimelineList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
