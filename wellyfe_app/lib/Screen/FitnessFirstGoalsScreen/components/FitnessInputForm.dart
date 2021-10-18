import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsHeightScreen/FitnessFirstGoalsHeightScreen.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/NextButton.dart';

class FitnessInputForm extends StatefulWidget {
  @override
  _FitnessInputFormState createState() => _FitnessInputFormState();
}

class _FitnessInputFormState extends State<FitnessInputForm> {
  ValueNotifier<String> weightGoals = ValueNotifier("Slide to select");
  ValueNotifier<String> dayGoals = ValueNotifier("Slide to select");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWeightGoalContainer(size),
                SizedBox(height: size.height * 0.025),
                buildDaysGoalContainer(size),
                SizedBox(height: size.height * 0.025),
                NextButton(
                  function: () {
                    Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: FitnessFirstGoalsHeightScreen(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ]
      )
    );
  }

  Container buildWeightGoalContainer(Size size) {
    return Container(
      width: size.height * 0.5,
      height: size.width * 0.4575,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0XFFF4F9FF),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-3, -3),
              color: Colors.grey.withOpacity(0.1)
          ),
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.25)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Weight Goals",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.005),
            ValueListenableBuilder<String>(
              valueListenable: weightGoals,
              builder: (BuildContext context, String data, Widget? children) {
                return Text(
                  weightGoals.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Container(
              height: 110,
              child: HorizontalPicker(
                minValue: 45,
                maxValue: 90,
                divisions: 45,
                suffix: " kg",
                showCursor: false,
                backgroundColor: Colors.transparent,
                activeItemTextColor: Color(0XFF394D70),
                passiveItemsTextColor: Colors.black.withOpacity(0.3),
                onChanged: (value) {
                  weightGoals.value = value.toString() + " kg";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDaysGoalContainer(Size size) {
    return Container(
      width: size.height * 0.5,
      height: size.width * 0.4575,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0XFFF4F9FF),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.grey.withOpacity(0.1)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            Text(
              "Days to achieve",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.005),
            ValueListenableBuilder<String>(
              valueListenable: dayGoals,
              builder: (BuildContext context, String data, Widget? children) {
                return Text(
                  dayGoals.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Container(
              height: 110,
              alignment: Alignment.center,
              child: HorizontalPicker(
                minValue: 1,
                maxValue: 90,
                divisions: 89,
                suffix: " days",
                showCursor: false,
                backgroundColor: Colors.transparent,
                activeItemTextColor: Color(0XFF394D70),
                passiveItemsTextColor: Colors.black.withOpacity(0.3),
                onChanged: (value) {
                  dayGoals.value = value.toInt().toString() + " days";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
