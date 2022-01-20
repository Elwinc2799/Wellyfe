import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/NutrionalContainerIndividual.dart';
import 'package:wellyfe_app/Core/Model/Food.dart';

class NutritionalContainer extends StatelessWidget {

  const NutritionalContainer({
    Key? key,
    required this.mealsList,
  }) : super(key: key);

  final Food mealsList;

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
            nutritional: mealsList.calories.toString()+" kcal",
          ),
          NutritionalContainerIndividual(
            category: "Carbs",
            nutritional: mealsList.carbs.toString()+" g",
          ),
          NutritionalContainerIndividual(
            category: "Protein",
            nutritional: mealsList.protein.toString()+" g",
          ),
          NutritionalContainerIndividual(
            category: "Fat",
            nutritional: mealsList.fat.toString()+" g",
          )
        ],
      ),
    );
  }
}