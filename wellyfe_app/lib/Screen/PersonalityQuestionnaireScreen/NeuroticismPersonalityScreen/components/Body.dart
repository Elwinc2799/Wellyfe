import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Questionnaire.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/NeuroticismPersonalityScreen/components/QuestionnaireButton.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/NeuroticismPersonalityScreen/components/SelectionButton.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Neuroticism Personality",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              height: size.height * 0.7,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(Questionnaire.neuroticismList.length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (index + 1).toString() + ". " + Questionnaire.neuroticismList[index],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.5)
                              ),
                            ),
                            SizedBox(height: size.height * 0.025),
                            SelectionButton(
                              question: index,
                            ),
                            SizedBox(height: size.height * 0.05),
                          ],
                        );
                      }),
                    ),
                    QuestionnaireButton(
                      title: "Next",
                      function: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

