import 'package:meals_app/models/meal.dart';

class MealStateModel {
  List<MealModel> meals;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isGlutenFree;

  MealStateModel(this.meals, this.isGlutenFree, this.isLactoseFree,
      this.isVegan, this.isVegetarian);
}
