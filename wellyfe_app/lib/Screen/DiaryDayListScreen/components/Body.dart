import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/DiaryContainer.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
        child: Column(
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            Container(
              height: size.height * 0.7,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      DiaryContainer(
                        dayNumber: "11",
                        dayString: "Wed",
                        mood: "happy",
                        weather: "sunny",
                        containImage: false,
                        content: "",
                        image: "",
                      ),
                      SizedBox(height: size.height * 0.03),
                      DiaryContainer(
                        dayNumber: "12",
                        dayString: "Thu",
                        mood: "very happy",
                        weather: "overcast",
                        containImage: true,
                        content: "",
                        image: "assets/pictures/testing.png",
                      ),
                    ],
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






