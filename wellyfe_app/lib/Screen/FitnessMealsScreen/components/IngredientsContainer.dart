import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/IngredientsContainerIndividual.dart';

class IngredientsContainer extends StatelessWidget {
  const IngredientsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IngredientsContainerIndividual(
            image: "assets/pictures/avocado.jpg",
            ingredients: "Avocado",
            grams: "50",
          ),
          IngredientsContainerIndividual(
            image: "assets/pictures/avocado.jpg",
            ingredients: "Avocado",
            grams: "50",
          ),
          IngredientsContainerIndividual(
            image: "assets/pictures/avocado.jpg",
            ingredients: "Avocado",
            grams: "50",
          ),
        ],
      ),
    );
  }
}