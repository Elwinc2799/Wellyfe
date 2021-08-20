import 'package:flutter/material.dart';

class NoConnectionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Opps..",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
            Image(image: AssetImage("assets/logo/disconnected.png")),
            Text(
              "Connection Lost!",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Text(
              "Hey, it looks like you don't have internet connection.\nPlease try again later.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27.5,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
