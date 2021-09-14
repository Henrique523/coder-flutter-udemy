import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/cart_button.dart';
import 'package:gerenciamento_estados/components/cart_item_component.dart';
import 'package:gerenciamento_estados/providers/cart.dart';
import 'package:gerenciamento_estados/providers/order_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Carrinho"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6?.color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CartButton(cart: cart),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) =>
                  CartItemComponent(cartItem: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
