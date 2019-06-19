import 'package:firebase_database/firebase_database.dart';

class RecipeMeal{
  String _name;
  String _imageUrl;
  Nutrition _nutrition;
  String _ingredients;
  String _instructions;
  String _mealsName;
  String _durations;
  String _healthScore;
  bool _isFavorite = false;

  RecipeMeal(this._name,
      this._imageUrl,
      this._nutrition,
      this._ingredients,
      this._instructions,
      this._mealsName,
      this._durations,
      this._healthScore,
      this._isFavorite);

  RecipeMeal.map(dynamic obj) {
    this._name = obj['name'];
    this._imageUrl = obj['imageUrl'];
    this._nutrition = obj['nutrition'];
    this._ingredients = obj['ingredients'];
    this._instructions = obj['instructions'];
    this._mealsName = obj['mealsName'];
    this._durations = obj['durations'];
    this._healthScore = obj['healthScore'];
    this._isFavorite = obj['isFavorite'];
  }

  String get name => _name;
  String get imageUrl => _imageUrl;
  Nutrition get nutrition => _nutrition;
  String get ingredients => _ingredients;
  String get instructions => _instructions;
  String get mealsName => _mealsName;
  String get durations => _durations;
  String get healthScore => _healthScore;
  bool get isFavorite => _isFavorite;

  RecipeMeal.fromSnapshot(DataSnapshot snapshot) {
    _name = snapshot.value['name'];
    _imageUrl = snapshot.value['imageUrl'];
    _nutrition = snapshot.value['nutrition'];
    _ingredients = snapshot.value['ingredients'];
    _instructions = snapshot.value['instructions'];
    _mealsName = snapshot.value['mealsName'];
    _durations = snapshot.value['durations'];
    _healthScore = snapshot.value['healthScore'];
    _isFavorite = snapshot.value['isFavorite'];
  }
}

class Nutrition{
  int _kcal;
  String _cards;
  String _protein;
  String _fat;
  String _fiber;
  String _sugar;
}