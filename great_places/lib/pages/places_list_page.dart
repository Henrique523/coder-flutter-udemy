import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Nenhum local cadastrado!'),
        ),
        builder: (ctx, greatPlaces, child) => greatPlaces.itemsCount == 0
            ? child!
            : ListView.builder(
              itemCount: greatPlaces.itemsCount,
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlaces.itemByIndex(index).image),
                ),
                title: Text(greatPlaces.itemByIndex(index).title),
                onTap: () { },
              ),
            ),
      ),
    );
  }
}
