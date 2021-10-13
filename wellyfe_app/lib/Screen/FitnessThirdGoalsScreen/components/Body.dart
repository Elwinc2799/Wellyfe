import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/components/NextButton.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/components/FoodContainerColumn.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 75.0, 25.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            Text(
              "Lighten on the plate,\nshall we?",
              style: TextStyle(
                fontSize: 27.5,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "Let us know of the food you don't eat.",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            FoodContainerColumn(),
            SizedBox(height: size.height * 0.025),
            NextButton(),
          ],
        ),
      )
    );
  }
}

