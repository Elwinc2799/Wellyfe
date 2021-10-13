import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/Clock.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/SleepWakeTime.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/Stopwatch.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Good Night",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Nunito",
                  fontSize: 30,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "As the day comes to an end, throw all your worries and troubles away.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w800,
                  fontFamily: "Nunito",
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Clock(),
              SizedBox(height: size.height * 0.025),
              SleepWakeTime(),
              SizedBox(height: size.height * 0.05),
              Container(
                child: Stopwatch(),
              )
            ],
          ),
        ),
      )
    );
  }
}
