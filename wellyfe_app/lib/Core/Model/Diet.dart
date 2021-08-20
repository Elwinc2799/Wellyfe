import 'package:wellyfe_app/Core/Model/Food.dart';

class Diet {
  final String dietName;
  final String dietDescription;
  final List<Food> dietFoodList;
  final List<Food> excludedFood;

  Diet(
    this.dietName,
    this.dietDescription,
    this.dietFoodList,
    this.excludedFood,
  );
}