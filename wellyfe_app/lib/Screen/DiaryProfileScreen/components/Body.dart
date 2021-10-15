import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/DiaryProfileScreen/components/DiariesFavourites.dart';
import 'package:wellyfe_app/Screen/DiaryProfileScreen/components/TopContainer.dart';
import 'package:wellyfe_app/Screen/DiaryProfileScreen/components/WeatherMood.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              TopContainer(),
              SizedBox(height: size.height * 0.04),
              DiariesFavourites(),
              SizedBox(height: size.height * 0.04),
              WeatherMood(),
            ],
          ),
        ),
      )
    );
  }
}



