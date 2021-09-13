import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/pages/cart_page.dart';
import 'package:gerenciamento_estados/pages/orders_page.dart';
import 'package:gerenciamento_estados/pages/product_form_page.dart';
import 'package:gerenciamento_estados/pages/products_page.dart';
import 'package:gerenciamento_estados/providers/order_list.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/product_list.dart';

import 'pages/product_detail_page.dart';
import 'pages/product_overview_page.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.PRODUCT_OVERVIEW: (ctx) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductsPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormPage(),
          // AppRoutes.PRODUCT_DETAIL: (ctx) => CounterPage(),
        },
      ),
    );
  }
}
