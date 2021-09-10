import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/models/cart_item.dart';

class CartItemComponent extends StatelessWidget {
  final CartItem cartItem;

  CartItemComponent({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Text(cartItem.name);
  }
}