import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/meal_detail.dart';

class MealItemController {
  void redirect(BuildContext context, MealModel model) {
    Navigator.pushNamed(context, MealDetail.route, arguments: model);
  }
}
