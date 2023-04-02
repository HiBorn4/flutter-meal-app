import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';

import 'favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2, child: Scaffold(
      appBar: AppBar(title: const Text('Meals'),
      bottom: const TabBar(tabs: <Widget>[
        Tab(
          icon: Icon(
            Icons.category,
            ),
          text: "Categories",
          ),
        Tab(
          icon: Icon(
            Icons.star,
          ),
          text: "Favourites",
        )
      ],
      ),
      ),
      body: const TabBarView(
        children: <Widget>[
          CategoriesScreen(),
          FavouritesScreen(),
        ],
      ),
    ),
    );
  }
}