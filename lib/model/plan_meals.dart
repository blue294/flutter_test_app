import 'package:firebase_database/firebase_database.dart';

class PlanMeals {
  String _name;
  String _description;
  String _imageUrl;
  String _key;
  String _categoryName;
  String _recipes;
  String _backgroundColor;
  String _about;
  String _whatBeEat;
  String _benefits;

  PlanMeals(this._name,
      this._description,
      this._imageUrl,
      this._key,
      this._categoryName,
      this._recipes,
      this._backgroundColor,
      this._about,
      this._whatBeEat,
      this._benefits);

  PlanMeals.map(dynamic obj) {
    this._name = obj['name'];
    this._description = obj['description'];
    this._imageUrl = obj['imageUrl'];
    this._key = obj['key'];
    this._categoryName = obj['categoryName'];
    this._recipes = obj['recipes'];
    this._backgroundColor = obj['backgroundColor'];
    this._about = obj['about'];
    this._whatBeEat = obj['whatBeEat'];
    this._benefits = obj['benefits'];
  }

  String get name => _name;
  String get description => _description;
  String get imageUrl => _imageUrl;
  String get key => _key;
  String get categoryName => _categoryName;
  String get recipes => _recipes;
  String get backgroundColor => _backgroundColor;
  String get about => _about;
  String get whatBeEat => _whatBeEat;
  String get benefits => _benefits;

  PlanMeals.fromSnapshot(DataSnapshot snapshot) {
    _key = snapshot.key;
    _name = snapshot.value['name'];
    _description = snapshot.value['description'];
    _imageUrl = snapshot.value['imageUrl'];
    _key = snapshot.value['key'];
    _categoryName = snapshot.value['categoryName'];
    _recipes = snapshot.value['recipes'];
    _backgroundColor = snapshot.value['backgroundColor'];
    _about = snapshot.value['about'];
    _whatBeEat = snapshot.value['whatBeEat'];
    _benefits = snapshot.value['benefits'];
  }

}

