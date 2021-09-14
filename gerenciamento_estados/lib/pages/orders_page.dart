import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/app_drawer.dart';
import 'package:gerenciamento_estados/components/order_component.dart';
import 'package:gerenciamento_estados/providers/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: () => _refreshOrders(context),
              child: Consumer<OrderList>(
                builder: (ctx, orders, child) {
                  return ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (context, index) {
                      return OrderComponent(order: orders.items[index]);
                    },
                  );
                },
              ),
            );
          }
        },
      ),
      // body: _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : RefreshIndicator(
      //       onRefresh: () => _refreshOrders(context),
      //       child: ListView.builder(
      //           itemCount: orders.itemsCount,
      //           itemBuilder: (context, index) {
      //             return OrderComponent(order: orders.items[index]);
      //           },
      //         ),
      //     ),
    );
  }
}
