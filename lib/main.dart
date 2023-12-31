import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/screens/filters_screen.dart';
import 'package:delimeals/screens/meal_detail_screen.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import 'models/meal.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{

  final ThemeData theme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData
          .light()
          .textTheme
          .copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
          )
      )

  );



  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _setFilters(Map<String, bool> filterData){

    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {

        if(_filters['gluten']! && !meal.isGlutenFree){
              return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }if(_filters['vegan']! && !meal.isVegan){
          return false;
        }if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }

        return true;
      }
      ).toList();
    });
  }

  /**
   * Add favorites meals to the list
   */
  void _toggleFavorites(String mealId){

    //it gets if the mealId exists in the list, and get the position on the list
    final existingIndex = _favoritesMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >= 0) {
      setState(() {
        _favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }

  }

  bool _isMealFavorite(String id){

    return _favoritesMeals.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoritesMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_setFilters, _filters),
      },
      /*onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },*/
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}