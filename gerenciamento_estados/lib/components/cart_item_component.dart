import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/models/cart_item.dart';

class CartItemComponent extends StatelessWidget {
  final CartItem cartItem;

  CartItemComponent({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text("${cartItem.price}"),
            ),
          ),
        ),
        title: Text(cartItem.name),
        subtitle: Text("Total: R\$ ${cartItem.price * cartItem.quantity}"),
        trailing: Text("${cartItem.quantity}x"),
      ),
    );
  }
}
