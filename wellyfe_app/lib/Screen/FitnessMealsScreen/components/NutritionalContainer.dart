import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/NutrionalContainerIndividual.dart';

class NutritionalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NutritionalContainerIndividual(
            category: "Calories",
            nutritional: "432 kcal",
          ),
          NutritionalContainerIndividual(
            category: "Carbs",
            nutritional: "26 g",
          ),
          NutritionalContainerIndividual(
            category: "Protein",
            nutritional: "5 g",
          ),
          NutritionalContainerIndividual(
            category: "Fat",
            nutritional: "6.7 g",
          )
        ],
      ),
    );
  }
}