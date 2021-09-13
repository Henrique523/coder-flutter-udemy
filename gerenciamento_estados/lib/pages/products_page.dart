import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/app_drawer.dart';
import 'package:gerenciamento_estados/components/product_item.dart';
import 'package:gerenciamento_estados/providers/product_list.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.productsCount,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  ProductItem(product: products.products[index]),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
