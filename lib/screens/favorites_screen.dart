
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

///
/// Show meals that user select as favorite meals.
///
class FavoritesScreen extends StatelessWidget{

  final List<Meal> favoritesMeal;

  FavoritesScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {

    if(favoritesMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet'),
      );
    } else {
      return ListView.builder(
          itemCount: favoritesMeal.length,
          itemBuilder: (context,index){
            return MealItem(meal: favoritesMeal[index]);
          },
      );
    }
  }

}