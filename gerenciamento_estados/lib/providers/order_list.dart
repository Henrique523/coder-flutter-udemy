import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_estados/models/order.dart';
import 'package:gerenciamento_estados/providers/cart.dart';

class OrderList extends ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
        0,
        Order(
          id: Random().nextDouble().toString(),
          date: DateTime.now(),
          total: cart.totalAmount,
          products: cart.items.values.toList(),
        ));
    notifyListeners();
  }
}
