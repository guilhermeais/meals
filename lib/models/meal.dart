enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    final parsedComplexities = {
      Complexity.Simple: "Simples",
      Complexity.Difficult: "Difícil",
      Complexity.Medium: "Normal",
    };

    return parsedComplexities[complexity] ?? 'Desconhecida';
  }

  String get costText {
    final parsedCosts = {
      Cost.Cheap: "Barato",
      Cost.Fair: "Justo",
      Cost.Expensive: "Caro",
    };

    return parsedCosts[cost] ?? 'Desconhecida';
  }
}
