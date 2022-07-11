import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item/meal_item.dart';
import '../../data/dummy_data.dart';

class Category extends StatelessWidget {
  static const route = "/recipe";

  final String recipeTitle;
  final String id;
  const Category({Key? key, required this.recipeTitle, required this.id})
      : super(key: key);

  final mealsList = DummyData.dummyData;
  final categories = DummyData.dummyCategories;

  @override
  Widget build(BuildContext context) {
    final mealsByCategories =
        mealsList.where((element) => element.categories.contains(id));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            context,
            model: mealsByCategories.elementAt(index),
            size: size,
          );
        },
        itemCount: mealsByCategories.length,
      ),
    );
  }
}
