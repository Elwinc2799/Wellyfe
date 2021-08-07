import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/CalContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 75.0, 40.0, 20.0),
            child: TopLevelBar(),
          ),
          Container(
            height: size.height * 0.45,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  top: -110,
                  right: -200,
                  child: Container(
                    height: 700,
                    width: 700,
                    child: Image(
                      image: AssetImage("assets/pictures/breakfast.png"),
                    ),
                  ),
                ),
                CalContainer(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Meals today",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          MealContainer(),
        ],
      ),
    );
  }
}




