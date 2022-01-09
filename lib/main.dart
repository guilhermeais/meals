import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Settings settings = Settings();
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return (!filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              )),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      // home: const CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
