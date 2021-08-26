import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Appointment.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 250.0, 30.0, 0),
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
                          function: () async {
                            getAllTaskScheduleData();
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
              )
            ],
          ),
        )
    );
  }
}






