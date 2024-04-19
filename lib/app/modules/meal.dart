enum Affordability { affordable, pricey, luxurious }

enum Complexity { simple, challenging, hard }

class Meal {
  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  Meal(
      {required this.id,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.categories,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});
}
