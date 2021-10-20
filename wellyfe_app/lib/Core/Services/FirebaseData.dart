import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Appointment.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Core/Model/Sleep.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Model/UserProfile.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/HomeMoodScreen/HomeMoodScreen.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/ScheduleOverviewScreen.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/SleepTrackerOverviewScreen.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/TherapyCareOverviewScreen.dart';

class FirebaseData {
  static final fireStoreInstance = FirebaseFirestore.instance;
  static final firebaseUser =  FirebaseAuth.instance.currentUser;

  static Future<void> getAllTaskScheduleData(context) async {

    List<Task> taskList = [];

    DateTime now = DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime startingPoint = new DateTime(firstDayOfWeek.year, firstDayOfWeek.month, firstDayOfWeek.day);

    fireStoreInstance
      .collection("tasks")
      .doc(firebaseUser!.uid)
      .collection("task")
      .where("dueDate", isGreaterThanOrEqualTo: startingPoint)
      .get()
      .then((value) {
        value.docs.forEach((result) {

          Timestamp timestamp = result.data()["dueDate"];

          taskList.add(
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

        taskList.sort((a, b) => a.dueDate.compareTo(b.dueDate));

        Provider
          .of<TaskProvider>(context, listen: false)
          .setTaskList(taskList);

        Navigator.push(context, PageTransition(
          type: PageTransitionType.fade,
          child: ScheduleOverviewScreen(),
        ));
      });
  }


  static Future<void> getAllFitnessData(context) async {

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

  static Future<void> getAllAppointmentData(context) async {
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

  static String getHour(int time) {
    if (time > 12)
      return ((time - 12).toString() + ".00 pm");
    else if (time == 12)
      return (time.toString() + ".00 pm");

    else return (time.toString() + ".00 am");
  }

  static Future<void> getAllDoctorData() async {
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

  static Future<void> getAllUserData() async {
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

  static Future<void> getAllMoodData(context) async {
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

  static Future<void> getAllSleepData(context) async {
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
}