import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Services/FirebaseData.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/LowerColumnWidget.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/MiddleColumnContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/UpperColumnContainer.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    FirebaseData.getAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        children: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 5.0, 20.0, 5.0),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     HorizontalContainer(
          //       title: "User",
          //       function: () {
          //         Navigator.push(context, PageTransition(
          //           type: PageTransitionType.fade,
          //           child: UserProfileScreen(),
          //         ));
          //       },
          //     ),
          //     SizedBox(height: size.height * 0.025),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Container(
          //           height: size.height * 0.525,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               LeftContainer(
          //                 function: () async {
          //                   FirebaseData.getAllTaskScheduleData(context);
          //                 },
          //                 title: "Schedule",
          //               ),
          //               LeftContainer(
          //                 function: () async {
          //                   FirebaseData.getAllSleepData(context);
          //                 },
          //                 title: "Sleep Tracker",
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           height: size.height * 0.525,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               RightOuterContainer(
          //                 function: () async {
          //                   FirebaseData.getAllDoctorData();
          //                   FirebaseData.getAllAppointmentData(context);
          //                 },
          //                 title: "Therapy Care",
          //               ),
          //               RightMiddleContainer(),
          //               RightOuterContainer(
          //                 function: () async {
          //                   FirebaseData.getAllDiaryData(context);
          //                 },
          //                 title: "Diary",
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //     SizedBox(height: size.height * 0.025),
          //     HorizontalContainer(
          //       title: "Mood Diary",
          //       function: () async {
          //         FirebaseData.getAllMoodData(context);
          //       },
          //     ),
          //   ],
          // ),

          child: Transform.rotate(
            angle: 315 * pi / 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UpperColumnContainer(),
                SizedBox(height: 20),
                MiddleColumnContainer(),
                SizedBox(height: 20),
                LowerColumnWidget()
              ],
            ),
          ),
        )
    );
  }
}








