import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/providers/auth.dart';
import 'package:gerenciamento_estados/providers/cart.dart';
import 'package:gerenciamento_estados/providers/product_list.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          );
        },
        child: GridTile(
          child: Hero(
            tag: "product-grid-${product.id}",
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                onPressed: () => product
                    .toggleFavorite(
                  auth.token ?? '',
                  auth.userId ?? '',
                )
                    .catchError((error) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Ocorreu um erro!'),
                      content: Text(
                          'Não foi possível atalizar o produto ${product.name}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                }),
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(product.name),
            trailing: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Conteúdo adicionado com sucesso!'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'DESFAZER',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
                cart.addItem(product);
              },
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
