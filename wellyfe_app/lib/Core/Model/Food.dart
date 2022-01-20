class Food {
  final String foodID;
  final String foodName;
  final List<dynamic> foodIngredients;
  final String foodCategory;
  final String foodImageUrl;
  final num calories;
  final num fat;
  final num protein;
  final num carbs;

  Food(
    this.foodID,
    this.foodName,
    this.foodIngredients,
    this.foodCategory,
    this.foodImageUrl,
    this.calories,
    this.fat,
    this.protein,
    this.carbs
  );

  static List<Food> foodDataList = [];

  static List<Food> mealsCategoryList(String meals) {
    return foodDataList.where(
            (element) => (element.foodCategory == (meals))
    ).toList();
  }
}