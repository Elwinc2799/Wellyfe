import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/DiaryOverviewScreen.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/LeftContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightMiddleContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightOuterContainer.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/ScheduleOverviewScreen.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/SleepTrackerOverviewScreen.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/TherapyCareOverviewScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final fireStoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getAllTaskScheduleData();
  }

  Future<void> getAllTaskScheduleData() async {
    fireStoreInstance
        .collection("tasks")
        .doc(firebaseUser!.uid)
        .collection("task")
        .get()
        .then((value) {
      value.docs.forEach((result) {

        Timestamp timestamp = result.data()["dueDate"];

        Task.taskDataList.add(
            Task(
              result.id,
              result.data()["taskName"],
              result.data()["taskPriority"],
              result.data()["taskCategory"],
              timestamp.toDate(),
              result.data()["startTime"],
              result.data()["endTime"],
              result.data()["isDone"],
            )
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 250.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.525,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeftContainer(
                          function: () {
                            Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              child: ScheduleOverviewScreen(),
                            ));
                          },
                          title: "Schedule",
                        ),
                        LeftContainer(
                          function: () {
                            Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              child: SleepTrackerOverviewScreen(),
                            ));
                          },
                          title: "Sleep Tracker",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.525,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RightOuterContainer(
                          function: () {
                            Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              child: TherapyCareOverviewScreen(),
                            ));
                          },
                          title: "Therapy Care",
                        ),
                        RightMiddleContainer(),
                        RightOuterContainer(
                          function: () {
                            Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              child: DiaryOverviewScreen(),
                            ));
                          },
                          title: "Diary",
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}





