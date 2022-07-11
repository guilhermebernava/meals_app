class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
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
    this.complexity = Complexity.simple,
    this.affordability = Affordability.affordable,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isLactoseFree = false,
    this.isGlutenFree = false,
    this.imageUrl = "",
    required this.ingredients,
  });
}

enum Complexity { simple, medium, hard, veryHard }

enum Affordability { affordable, pricey, luxurious }
