import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorites_screen.dart';
import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

///
/// Is a tabNab where user can swipe between Categories and favorites meals
///
class TabsScreen extends StatefulWidget {

  final List<Meal> favoritesMeal;

  TabsScreen(this.favoritesMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    /* !!!!!!!!!!!!!!THIS IS FOR TABBAR ON THE TOP OF THE SCREEN!!!!!!!!!!!!!!
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[CategoriesScreen(), FavoritesScreen()],
          ),
        ));*/

    // !!!!!!!!!!!!!!THIS IS FOR TABBAR ON THE BOTTOM OF THE SCREEN!!!!!!!!!!!!!!
    List<Map<String, Object>> _pages = [
      {'page':CategoriesScreen(), 'title': 'Categories'},
      {'page':FavoritesScreen(widget.favoritesMeal), 'title': 'Favorites'}
    ];
    int _selectedPageIndex = 0;

    void _selectedPage(int index){

      setState(() {
        _selectedPageIndex = index;
      });

    }

    return Scaffold(
      appBar: AppBar(
        title:  Text(_pages[_selectedPageIndex]['title'] as String ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favorites'
          )
        ],
      ),
    );
  }
}


































