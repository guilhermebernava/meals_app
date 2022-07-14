import 'dart:convert';

import 'package:meals_app/data/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal_state_model.dart';

class SharedPreferencesServices {
  static Future<MealStateModel> initState() async {
    final instance = await SharedPreferences.getInstance();

    final model = {
      "meals": DummyData.dummyMeals,
      "isGlutenFree": false,
      "isLactoseFree": false,
      "isVegan": false,
      "isVegetarian": false,
    };

    if (instance.containsKey(MealStateModel.keySharedPrefences)) {
      return MealStateModel.fromJson(
          instance.getString(MealStateModel.keySharedPrefences) ??
              jsonEncode(model));
    }

    return MealStateModel([], false, false, false, false);
  }
}
