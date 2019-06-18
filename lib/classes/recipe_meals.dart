class RecipeMeal{
  String name;
  String imageUrl;
  Nutrition nutrition;
  String ingredients;
  String instructions;
  String mealsName;
  String durations;
  String healthScore;
  bool isFavorite = false;
}

class Nutrition{
  int kcal;
  String cards;
  String protein;
  String fat;
  String fiber;
  String sugar;
}