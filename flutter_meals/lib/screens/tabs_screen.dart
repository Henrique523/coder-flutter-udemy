import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../components/bottom_navitagion.dart';

import '../models/meal.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen({
    required this.favoriteMeals,
  });

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> favoriteMeals = [];
  
  int selectedIndex = 0;

  late List<Widget> _tabScreens;

  @override
  void initState() {
    super.initState();
    _tabScreens = [
    CategoriesScreen(),
    FavoriteScreen(widget.favoriteMeals),
  ];
  }

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[selectedIndex]),
        centerTitle: true,
      ),

      body: _tabScreens[selectedIndex],

      drawer: MainDrawer(),

      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
