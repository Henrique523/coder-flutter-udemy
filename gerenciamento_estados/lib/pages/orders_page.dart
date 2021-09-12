import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/app_drawer.dart';
import 'package:gerenciamento_estados/components/order_component.dart';
import 'package:gerenciamento_estados/providers/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos.'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) {
          return OrderComponent(order: orders.items[index]);
        },
      ),
    );
  }
}
