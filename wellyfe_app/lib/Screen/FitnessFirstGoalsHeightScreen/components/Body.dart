import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsHeightScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/NextButton.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/FitnessSecondGoalsScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int height = 170;
  ValueNotifier<String> currentWeight = ValueNotifier("Slide to select");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.05),
            Text(
              "Tell us of your current\nfitness details. ",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.035),
            buildCurrentWeightContainer(size),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Container(
                height: size.height * 0.3,
                child: HeightSlider(
                  height: height,
                  onChange: (val) => setState(() => height = val),
                  unit: "cm",
                  personImagePath: "assets/pictures/height.svg",
                  primaryColor: Color(0XFF394D70),
                  currentHeightTextColor: Color(0XFF394D70),
                  accentColor: Color(0XFF394D70),
                  numberLineColor: Color(0XFF394D70),
                  sliderCircleColor: Color(0XFF394D70),
                  maxHeight: 200,
                ),
              ),
            ),
            NextButton(
              function: () {
                Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade,
                  child: FitnessSecondGoalsScreen(),
                ));
              },
            )
          ],
        ),
      )
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
}
