import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessBreakfastScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';

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
              height: size.height * 0.4,
              child: Image(
                image: AssetImage("assets/pictures/avocadoEgg.png"),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
