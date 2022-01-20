class Ingredients {
  final String ingredientsID;
  final String ingredientsName;
  final String ingredientsUrl;

  Ingredients(
      this.ingredientsID,
      this.ingredientsName,
      this.ingredientsUrl,
      );

  static List<Ingredients> ingredientsList = [];

  static List<Ingredients> ingredientsDataList(List ingredientsIDList) {
    List<Ingredients> newList = [];

    for (var ingredients in ingredientsIDList) {
      newList.add(
        ingredientsList.firstWhere((element) => (element.ingredientsID == (ingredients))
      ));
    }

    return newList;
  }
}