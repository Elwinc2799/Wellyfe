import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Food.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/Body.dart';

class FitnessMealsScreen extends StatelessWidget {

  const FitnessMealsScreen({
    Key? key,
    required this.mealsList,
  }) : super(key: key);

  final Food mealsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(mealsList: mealsList),
    );
  }
}
