import 'recipe_meals.dart';

class PlanMeals {
  String name;
  String description;
  String imageUrl;
  String key;
  String categoryName;
  List<RecipeMeal> recipes;
  String backgroundColor;
  String about;
  String whatBeEat;
  String benefits;

  PlanMeals(this.name,
      this.description,
      this.imageUrl,
      this.key,
      this.categoryName,
      this.recipes,
      this.backgroundColor,
      this.about,
      this.whatBeEat,
      this.benefits);
}