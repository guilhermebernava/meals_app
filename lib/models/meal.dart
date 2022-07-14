import 'dart:convert';

class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final int complexity;
  final int affordability;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isGlutenFree;

  const MealModel({
    required this.title,
    required this.duration,
    required this.id,
    required this.categories,
    required this.steps,
    this.complexity = 1,
    this.affordability = 1,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isLactoseFree = false,
    this.isGlutenFree = false,
    this.imageUrl = "",
    required this.ingredients,
  });

  factory MealModel.fromMap(Map<String, dynamic> map) {
    var list = map['categories'] as List<dynamic>;
    var listIn = map['ingredients'] as List<dynamic>;
    var listSt = map['steps'] as List<dynamic>;
    List<String> categoryList = [];
    List<String> stepsList = [];
    List<String> ingredientsList = [];

    for (var json in list) {
      categoryList.add(json);
    }
    for (var json in listIn) {
      ingredientsList.add(json);
    }
    for (var json in listSt) {
      stepsList.add(json);
    }

    return MealModel(
        isGlutenFree: map['isGlutenFree'],
        isLactoseFree: map['isLactoseFree'],
        isVegan: map['isVegan'],
        isVegetarian: map['isVegetarian'],
        categories: categoryList,
        duration: map['duration'],
        id: map['id'],
        ingredients: ingredientsList,
        steps: stepsList,
        imageUrl: map['imageUrl'],
        title: map['title'],
        affordability: map['affordability'],
        complexity: map['complexity']);
  }

  factory MealModel.fromJson(String json) =>
      MealModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "duration": duration,
        "isGlutenFree": isGlutenFree,
        "isLactoseFree": isLactoseFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "steps": steps,
        "ingredients": ingredients,
        "categories": categories,
        "affordability": affordability,
        "complexity": complexity,
      };

  String toJson() => jsonEncode(toMap());
}
