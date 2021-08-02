import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/Clock.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/TitleTime.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Good Night",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Nunito",
                  fontSize: 40,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "As the day comes to an end, throw all your worries and troubles away.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w800,
                  fontFamily: "Nunito",
                  fontSize: 25,
                ),
              ),
              SizedBox(height: size.height * 0.075),
              Clock(),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TitleTime(
                    title: "In The\nBed At",
                    time: "10:00 PM",
                  ),
                  TitleTime(
                    title: "Out Of\nBed At",
                    time: "6:00 AM",
                  )
                ],
              ),
              SizedBox(height: size.height * 0.05),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.075,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 5
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: Center(
                    child: Text(
                      "Stop Tracking",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Nunito",
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}

