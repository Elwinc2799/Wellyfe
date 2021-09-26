import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/IngredientsContainer.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/IngredientsContainerIndividual.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/MealPicture.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/NutritionalContainer.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopLevelBar(mealType: mealType("Breakfast")),
                MealPicture(image: "assets/pictures/avocadoEgg.png"),
                SizedBox(height: size.height * 0.05),
                Container(
                  width: size.width * 0.65,
                  child: Text(
                    "Avocado Egg with Slices of Apples and Cucumber",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 27.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                NutritionalContainer(),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width * 0.65,
                  child: Text(
                    "Ingredients",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                IngredientsContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String mealType(String meal) {
    switch (meal.toLowerCase()) {
      case "breakfast":
        return "B R E A K F A S T";
      case "lunch":
        return "L U N C H";
      case "dinner":
        return "D I N N E R";
    }

    return "";
  }

}









