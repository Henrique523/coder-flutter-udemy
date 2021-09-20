import 'package:chat_firebase/core/services/notification/chat_noticiation_service.dart';
import 'package:chat_firebase/pages/auth_or_app_page.dart';
import 'package:chat_firebase/pages/loading_page.dart';
import 'package:chat_firebase/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatNotificationService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (ctx) => AuthOrAppPage(),
          AppRoutes.AUTH_PAGE: (ctx) => LoadingPage(),
        },
      ),
    );
  }
}
