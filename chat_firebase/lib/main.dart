import 'package:chat_firebase/pages/auth_page.dart';
import 'package:chat_firebase/pages/loading_page.dart';
import 'package:chat_firebase/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => AuthPage(),
        AppRoutes.AUTH_PAGE: (ctx) => LoadingPage(),
      },
    );
  }
}