import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {

  final int selectedIndex;
  final void Function(int) onItemTapped;

  BottomNavigation({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedIndex,
        onTap: (int index) => onItemTapped(index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      );
  }
}