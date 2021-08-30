import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Appointment.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Core/Model/Sleep.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Model/UserProfile.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/DiaryOverviewScreen.dart';
import 'package:wellyfe_app/Screen/HomeMoodScreen/HomeMoodScreen.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/HorizontalContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/LeftContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightMiddleContainer.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/RightOuterContainer.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/ScheduleOverviewScreen.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/SleepTrackerOverviewScreen.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/TherapyCareOverviewScreen.dart';
import 'package:wellyfe_app/Screen/UserProfileScreen/UserProfileScreen.dart';

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
    getAllUserData();
  }

  Future<void> getAllTaskScheduleData() async {
    Task.taskDataList = [];

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

      Task.taskDataList.sort((a, b) => a.dueDate.compareTo(b.dueDate));

      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: ScheduleOverviewScreen(),
      ));
    });
  }

  Future<void> getAllDiaryData() async {
    Diary.diaryDataList = [];

    fireStoreInstance
      .collection("diaries")
      .doc(firebaseUser!.uid)
      .collection("diary")
      .get()
      .then((value) {
        value.docs.forEach((result) {

          Timestamp timestamp = result.data()["date"];

          Diary.diaryDataList.add(
            Diary(
              result.id,
              result.data()["title"],
              result.data()["content"],
              result.data()["mood"],
              result.data()["weather"],
              result.data()["image"],
              result.data()["favourite"],
              timestamp.toDate(),
            )
          );

        });

      Diary.diaryDataList.sort((a, b) => a.dateTime.compareTo(b.dateTime));

      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: DiaryOverviewScreen(),
      ));
    });
  }

  Future<void> getAllFitnessData() async {

    fireStoreInstance
      .collection("fitnesses")
      .doc(firebaseUser!.uid)
      .collection("fitness")
      .get()
      .then((value) {
      value.docs.forEach((result) {

       if (result.exists)
         print(true);
       else
         print(false);

      });


    });
  }

  Future<void> getAllAppointmentData() async {
    Appointment.appointmentDataList = [];

    fireStoreInstance
      .collection("appointments")
      .doc(firebaseUser!.uid)
      .collection("appointment")
      .get()
      .then((value) {
      value.docs.forEach((result) {
        Timestamp timestamp = result.data()["appointmentDate"];

        Appointment.appointmentDataList.add(
          Appointment(
            result.id,
            firebaseUser!.uid,
            result.data()["doctorID"],
            timestamp.toDate(),
            getHour(result.data()["appointmentTime"]),
          )
        );
      });

      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: TherapyCareOverviewScreen(),
      ));
    });
  }

  String getHour(int time) {
    if (time > 12)
      return ((time - 12).toString() + ".00 pm");
    else if (time == 12)
      return (time.toString() + ".00 pm");

    else return (time.toString() + ".00 am");
  }

  Future<void> getAllDoctorData() async {
    Doctor.doctorDataList = [];

    fireStoreInstance
      .collection("doctors")
      .get()
      .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          Doctor.doctorDataList.add(
            Doctor(
              result.id,
              result.data()["name"],
              result.data()["gender"],
              result.data()["graduateUniversity"],
              result.data()["yearsExperience"],
              result.data()["specialisedTherapy"],
              result.data()["patientsHelped"],
              result.data()["ratings"],
              result.data()["biography"],
            )
          );
        });
      }
    );
  }

  Future<void> getAllUserData() async {
    await fireStoreInstance
      .collection("users")
      .doc(firebaseUser!.uid)
      .get()
      .then((value) {
        UserProfile.userDetails.imageUrl = value.data()!["imageUrl"];
        UserProfile.userDetails.userEmail = firebaseUser!.email.toString();
        UserProfile.userDetails.personality = value.data()!["personality"];
        UserProfile.userDetails.name = value.data()!["name"];
      });
  }

  Future<void> getAllMoodData() async {
    Mood.moodDataList = [];

    fireStoreInstance
        .collection("moods")
        .doc(firebaseUser!.uid)
        .collection("mood")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        Timestamp timestamp = result.data()["date"];

        Mood.moodDataList.add(
          Mood(
            result.id,
            result.data()["mood"],
            timestamp.toDate(),
          )
        );
      });

      Mood.moodDataList.sort((a, b) => a.date.compareTo(b.date));

      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: HomeMoodScreen(),
      ));
    });
  }

  Future<void> getAllSleepData() async {
    Sleep.sleepDataList = [];
    double total = 0;

    fireStoreInstance
      .collection("sleeps")
      .doc(firebaseUser!.uid)
      .collection("sleep")
      .get()
      .then((value) {
      value.docs.forEach((result) {
        Timestamp timestamp = result.data()["date"];

        Sleep.sleepDataList.add(
          Sleep(
            result.data()["asleepTime"],
            result.data()["awakeTime"],
            timestamp.toDate(),
          )
        );

        total += result.data()["asleepTime"];
      });

      Sleep.averageSleep = total / Sleep.sleepDataList.length;

      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: SleepTrackerOverviewScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HorizontalContainer(
                title: "User",
                function: () {
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.fade,
                    child: UserProfileScreen(),
                  ));
                },
              ),
              SizedBox(height: size.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.525,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeftContainer(
                          function: () async {
                            getAllTaskScheduleData();
                          },
                          title: "Schedule",
                        ),
                        LeftContainer(
                          function: () async {
                            getAllSleepData();
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
                          function: () async {
                            getAllDoctorData();
                            getAllAppointmentData();
                          },
                          title: "Therapy Care",
                        ),
                        RightMiddleContainer(),
                        RightOuterContainer(
                          function: () async {
                            getAllDiaryData();
                          },
                          title: "Diary",
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.025),
              HorizontalContainer(
                title: "Mood Diary",
                function: () async {
                  getAllMoodData();
                },
              ),
            ],
          ),

          // child: Transform.rotate(
          //   angle: 315 * pi / 180,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 75.0),
          //         child: Container(
          //           width: size.width * 0.8,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Container(
          //                     height: 50,
          //                     width: 50,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5.0),
          //                       color: Color(0XFFDFDFE7),
          //                     ),
          //                   ),
          //                   SizedBox(height: 20),
          //                   Container(
          //                     height: 75,
          //                     width: 75,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15.0),
          //                         color: Color(0XFFF2F3F7),
          //                         boxShadow: [
          //                           BoxShadow(
          //                               blurRadius: 5.0,
          //                               offset: Offset(-3, -3),
          //                               color: Colors.white
          //                           ),
          //                           BoxShadow(
          //                               blurRadius: 5.0,
          //                               offset: Offset(3, 3),
          //                               color: Colors.black.withOpacity(.15)
          //                           )
          //                         ]
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               Container(
          //                 height: 150,
          //                 width: 150,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                     color: Color(0XFFF2F3F7),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(-3, -3),
          //                           color: Colors.white
          //                       ),
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(3, 3),
          //                           color: Colors.black.withOpacity(.15)
          //                       )
          //                     ]
          //                 ),
          //               ),
          //               Container(
          //                 height: 100,
          //                 width: 100,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                     color: Color(0XFFF2F3F7),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(-3, -3),
          //                           color: Colors.white
          //                       ),
          //                       BoxShadow(
          //                           blurRadius: 5.0,
          //                           offset: Offset(3, 3),
          //                           color: Colors.black.withOpacity(.15)
          //                       )
          //                     ]
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 100.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             Container(
          //               height: 150,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             Container(
          //               height: 125,
          //               width: 125,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 275.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.0),
          //                   color: Color(0XFFF2F3F7),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(-3, -3),
          //                         color: Colors.white
          //                     ),
          //                     BoxShadow(
          //                         blurRadius: 5.0,
          //                         offset: Offset(3, 3),
          //                         color: Colors.black.withOpacity(.15)
          //                     )
          //                   ]
          //               ),
          //             ),
          //             SizedBox(width: 20),
          //             Container(
          //               height: 75,
          //               width: 75,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10.0),
          //                   color: Color(0XFFDFDFE7),
          //               ),
          //             ),
          //             SizedBox(width: 20),
          //             Container(
          //               height: 40,
          //               width: 40,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 color: Color(0XFFDFDFE7),
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        )
    );
  }
}






