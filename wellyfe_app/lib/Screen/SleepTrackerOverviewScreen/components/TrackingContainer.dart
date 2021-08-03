import 'package:flutter/material.dart';
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
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0XFF373749),
                Color(0XFF4D4D65),
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.black54,
                offset: Offset(3.0, 3.0),
              ),
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0XFF303030),
                offset: Offset(-3.0, -3.0),
              )
            ]
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Sleep is a Reachable Dream.",
                    style: TextStyle(
                      fontSize: 27.5,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w900,
                      color: Color(0XFFD8D8EA),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Sleep Time: " + "10:00" + " PM - " + "6:00" + " AM",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w900,
                      color: Color(0XFFD8D8EA).withOpacity(0.5),
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
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SleepTrackerScreen();
                      }
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