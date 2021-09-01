import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/NextButton.dart';

class FitnessInputForm extends StatefulWidget {
  @override
  _FitnessInputFormState createState() => _FitnessInputFormState();
}

class _FitnessInputFormState extends State<FitnessInputForm> {
  ValueNotifier<String> currentWeight = ValueNotifier("Slide to select");
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
            child: Container(
              height: size.height * 0.48,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCurrentWeightContainer(size),
                      SizedBox(height: size.height * 0.035),
                      buildWeightGoalContainer(size),
                      SizedBox(height: size.height * 0.035),
                      buildDaysGoalContainer(size),
                      SizedBox(height: size.height * 0.035),
                      NextButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCurrentWeightContainer(Size size) {
    return Container(
      width: size.height * 0.5,
      height: size.width * 0.375,
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
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Text(
              "Current Weight",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: currentWeight,
              builder: (BuildContext context, String data, Widget? children) {
                return Text(
                  currentWeight.value,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Container(
              height: 120,
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
                  currentWeight.value = value.toString() + " kg";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildWeightGoalContainer(Size size) {
    return Container(
      width: size.height * 0.5,
      height: size.width * 0.375,
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
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Text(
              "Weight Goals",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: weightGoals,
              builder: (BuildContext context, String data, Widget? children) {
                return Text(
                  weightGoals.value,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Container(
              height: 120,
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
      height: size.width * 0.375,
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
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Text(
              "Days to achieve",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: dayGoals,
              builder: (BuildContext context, String data, Widget? children) {
                return Text(
                  dayGoals.value,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Container(
              height: 120,
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
