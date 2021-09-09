import 'package:flutter/material.dart';

import 'models/product_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
