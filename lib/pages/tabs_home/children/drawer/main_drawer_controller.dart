import 'package:flutter/material.dart';
import 'package:meals_app/pages/filter.dart';

class MainDrawerController {
  void onTapMeals(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/");
  }

  void onTapFilters(BuildContext context) {
    Navigator.pushNamed(context, Filter.route);
  }
}
