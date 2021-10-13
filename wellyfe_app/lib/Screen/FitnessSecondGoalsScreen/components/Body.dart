import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/DietContainerList.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopLevelBar(),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "Tell us the diet of\nyour liking.",
                    style: TextStyle(
                      fontSize: 27.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Select the diet by pressing.",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans",
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            DietContainerList()
          ],
        ),
      )
    );
  }
}





