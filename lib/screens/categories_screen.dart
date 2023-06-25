import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

///
/// Show a gridView with all the categories that data has.
/// Show the title's category and a color that every category has
///
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(category.id,category.title, category.color))
              .toList(),
        );
  }
}
