import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/components/PictureContainer.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/components/TitleMoodTime.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            PictureContainer(
              image: "assets/pictures/testing.png",
            ),
            SizedBox(height: size.height * 0.03),
            TitleTimeMood(
              title: "Hey",
              time: DateFormat('EEE, MMM d / y').format(DateTime.now()).toUpperCase(),
              mood: "happy",
              weather: "sunny",
            ),
            SizedBox(height: size.height * 0.05),
            Center(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.25,
                child: Text(
                  "I'm good.",
                  style: TextStyle(
                    fontSize: 27.5,
                    fontFamily: "Montserrat",
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


