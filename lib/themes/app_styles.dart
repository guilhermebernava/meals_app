import 'package:flutter/material.dart';
import 'package:meals_app/themes/app_colors.dart';

class AppStyles {
  static const mealItemTitle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 25,
    color: Colors.white,
    backgroundColor: Colors.black54,
  );
  static const mealtDetailsTitle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.secundary,
  );
  static const mealtDetailsItem = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const selectedTab = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.pink,
  );
  static const unselectedTab = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const categoryTitle = TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
