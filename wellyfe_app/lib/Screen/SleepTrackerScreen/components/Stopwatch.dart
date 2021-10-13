import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {

  @override
  Widget build(BuildContext context) {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;

    Size size = MediaQuery.of(context).size;
    ValueNotifier<bool> isRunning = ValueNotifier(true);
    var sleepTime;

    final StopWatchTimer _stopWatchTimer = StopWatchTimer(
      onChange: (value) {
        sleepTime = StopWatchTimer.getDisplayTime(value);
      }
    );
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    Future<void> addNewSleepData(String hour, String minute) async {
      double asleepTime = double.parse(hour) + (double.parse(minute) / 60);

      await firestoreInstance
        .collection("sleeps")
        .doc(firebaseUser!.uid)
        .collection("sleep")
        .add({
          "asleepTime": asleepTime,
          "awakeTime": 24 - asleepTime,
          "date": DateTime.now(),
        });

    }

    return Column(
      children: [
        Text(
          "Slept for",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w800,
            fontFamily: "Nunito",
            fontSize: 20,
          ),
        ),
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: _stopWatchTimer.rawTime.value,
          builder: (context, snapshot) {
            final value = snapshot.data!;
            final displayTime = StopWatchTimer.getDisplayTime(
              value,
              hours: true,
              minute: true,
              second: false,
              milliSecond: false,
            );
            return Text(
              displayTime,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Nunito",
                fontSize: 20,
              ),
            );
          }
        ),
        SizedBox(height: size.height * 0.03),
        GestureDetector(
          onTap: () {
            isRunning.value = !isRunning.value;

            if (!isRunning.value) {
              _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
              addNewSleepData(sleepTime.toString().substring(0, 2), sleepTime.toString().substring(3, 5));
            }
            else
              _stopWatchTimer.onExecute.add(StopWatchExecute.start);
          },
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.35,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 2
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child: Center(
                child: ValueListenableBuilder(
                  valueListenable: isRunning,
                  builder: (BuildContext context, bool flag, Widget? children) {
                    return Text(
                      isRunning.value ? "Stop" : "Start",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Nunito",
                        fontSize: 20,
                      ),
                    );
                  },
                )
            ),
          ),
        )
      ],
    );
  }
}

