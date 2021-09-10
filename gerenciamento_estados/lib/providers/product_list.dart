import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _products = DUMMY_PRODUCTS;
  // bool _showFavoriteOnly = false;

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts => _products.where((element) => element.isFavorite).toList();

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}