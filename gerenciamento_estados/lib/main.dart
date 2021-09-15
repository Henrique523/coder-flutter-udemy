import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/pages/auth_or_home_page.dart';
import 'package:gerenciamento_estados/pages/auth_page.dart';
import 'package:gerenciamento_estados/pages/cart_page.dart';
import 'package:gerenciamento_estados/pages/orders_page.dart';
import 'package:gerenciamento_estados/pages/product_form_page.dart';
import 'package:gerenciamento_estados/pages/products_page.dart';
import 'package:gerenciamento_estados/providers/auth.dart';
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
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) => ProductList(
            auth.token ?? '',
            auth.userId ?? '',
            previous?.products ?? [],
          ),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) => OrderList(
            auth.token ?? '',
            auth.userId ?? '',
            previous?.items ?? [],
          ),
        ),
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
          AppRoutes.AUTH_OR_HOME: (ctx) => AuthOrHomePage(),
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
