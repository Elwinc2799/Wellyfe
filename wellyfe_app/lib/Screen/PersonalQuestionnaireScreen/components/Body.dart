import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/PersonalQuestionnaireScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/PersonalQuestionnaireScreen/components/QuestionnaireForm.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's get started!",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              "We like to get to know you better.",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.05),
            QuestionnaireForm(),
          ],
        ),
      ),
    );
  }
}

