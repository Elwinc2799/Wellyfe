import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/FitnessInputForm.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 75.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            Text(
              "Tell us of your primary\nfitness goal. ",
              style: TextStyle(
                fontSize: 27.5,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "It should be achievable.",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            FitnessInputForm(),
          ],
        ),
      ),
    );
  }
}