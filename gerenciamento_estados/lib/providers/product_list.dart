import 'dart:math';

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _products = DUMMY_PRODUCTS;
  // bool _showFavoriteOnly = false;

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts => _products.where((element) => element.isFavorite).toList();

  int get productsCount {
    return _products.length;
  }

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

  void updateProduct(Product product) {
    int index = _products.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(Product product) {
    int index = _products.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _products.removeAt(index);
      notifyListeners();
    }
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
        id: hasId ? data['id'] as String : Random().nextDouble().toString(),
        name: data['name'] as String,
        description: data['description'] as String,
        price: data['price'] as double,
        imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }


    notifyListeners();
  }
}