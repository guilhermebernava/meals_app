import 'dart:convert';
import 'package:meals_app/models/meal.dart';

class MealStateModel {
  static const String keySharedPrefences = 'mealState';

  List<MealModel> meals;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isGlutenFree;

  MealStateModel(this.meals, this.isGlutenFree, this.isLactoseFree,
      this.isVegan, this.isVegetarian);

  factory MealStateModel.fromMap(Map<String, dynamic> map) {
    var list = map['meals'] as List<dynamic>;
    List<MealModel> finalList = [];

    for (var json in list) {
      var model = MealModel.fromJson(json);

      if (finalList.where((element) => element.id == model.id).isNotEmpty) {
        continue;
      }

      finalList.add(model);
    }
    return MealStateModel(
      finalList,
      map['isGlutenFree'],
      map['isLactoseFree'],
      map['isVegan'],
      map['isVegetarian'],
    );
  }

  factory MealStateModel.fromJson(String json) =>
      MealStateModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "meals": meals,
        "isGlutenFree": isGlutenFree,
        "isLactoseFree": isLactoseFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
      };

  String toJson() => jsonEncode(toMap());
}
