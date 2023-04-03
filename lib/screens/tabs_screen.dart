import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'favourites_screen.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  const TabsScreen(this._favouriteMeals, {Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(widget._favouriteMeals), 'title': 'Favourites'},
  ];
    super.initState();
  }

  void _selectPage (int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories"),
      // appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),
      ),
      // ignore: prefer_const_constructors
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ]
      ),
    );
  }
}