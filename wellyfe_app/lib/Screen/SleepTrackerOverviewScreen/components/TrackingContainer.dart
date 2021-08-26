import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/SleepTrackerScreen.dart';

class TrackingContainer extends StatelessWidget {
  const TrackingContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width - 80,
        height: size.height * 0.225,
        decoration: BoxDecoration(
          color: Color(0XFFF4F9FF),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.grey.withOpacity(0.1)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
        ),
        child: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(
                gradients: [[Color(0xFFCDD2EB), Color(0xFFD0D4E9)]],
                durations: [35000],
                heightPercentages: [0.5, 0.6],
                blur: MaskFilter.blur(BlurStyle.inner, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 3,
              heightPercentange: 0.3,
              size: size,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good sleep is a reachable dream.",
                    style: TextStyle(
                      fontSize: 27.5,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w900,
                      color: Color(0XFF394D70),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Sleep Time: " + "10:00" + " PM - " + "6:00" + " AM",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w900,
                      color: Color(0XFF394D70).withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                ],
              ),
            ),
            Positioned(
              right: size.width * 0.1,
              bottom: size.height * 0.025,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.fade,
                    child: SleepTrackerScreen(),
                  ));
                },
                child: Container(
                  height: size.height * 0.0375,
                  width: size.width * 0.325,
                  decoration: BoxDecoration(
                      color: Color(0XFF987EF5),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: Center(
                    child: Text(
                      "Start Tracking",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}