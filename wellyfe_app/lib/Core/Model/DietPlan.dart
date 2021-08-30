import 'package:wellyfe_app/Core/Model/Food.dart';

class DietPlan {
  final int calories;
  final int carb;
  final int protein;
  final int fat;
  final List<Food> dietFood;

  DietPlan(
    this.calories,
    this.carb,
    this.protein,
    this.fat,
    this.dietFood
  );
}