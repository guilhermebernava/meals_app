enum MealType {
  isGlutenFree,
  isLactoseFree,
  isVegan,
  isVegetarian,
}

enum Complexity {
  simple(1),
  medium(1),
  hard(2);

  final int id;

  const Complexity(this.id);

  factory Complexity.fromId(int id) {
    return values.firstWhere((e) => e.id == id,
        orElse: () => Complexity.simple);
  }
}

enum Affordability {
  affordable(1),
  pricey(1),
  luxurious(2);

  final int id;

  const Affordability(this.id);

  factory Affordability.fromId(int id) {
    return values.firstWhere((e) => e.id == id,
        orElse: () => Affordability.pricey);
  }
}
