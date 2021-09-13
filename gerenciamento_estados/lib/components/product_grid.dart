import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_grid_item.dart';
import '../models/product.dart';
import '../providers/product_list.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;

  ProductGrid({
    required this.showFavoriteOnly,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = showFavoriteOnly 
      ? provider.favoriteProducts
      : provider.products;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
