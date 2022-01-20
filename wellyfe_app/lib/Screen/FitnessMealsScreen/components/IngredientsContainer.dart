import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/IngredientsContainerIndividual.dart';
import 'package:wellyfe_app/Core/Model/Food.dart';
import 'package:wellyfe_app/Core/Model/Ingredients.dart';

class IngredientsContainer extends StatelessWidget {

  const IngredientsContainer({
    Key? key,
    required this.mealsList,
  }) : super(key: key);

  final Food mealsList;

  @override
  Widget build(BuildContext context) {
    List<Ingredients> ingredientsList = Ingredients.ingredientsDataList(mealsList.foodIngredients);

    return Container(
      child: Column(
        children:
        List.generate(ingredientsList.length, (index) =>

               IngredientsContainerIndividual(
                 image: ingredientsList[index].ingredientsUrl,
                 ingredients: ingredientsList[index].ingredientsName,
               )

        )
      ),
    );
  }
}