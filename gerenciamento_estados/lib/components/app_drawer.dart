import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo usuário!'),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Loja'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.PRODUCT_OVERVIEW);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pedidos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Gerenciar produtos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
              }),
        ],
      ),
    );
  }
}
