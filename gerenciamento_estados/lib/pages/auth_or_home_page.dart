import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/pages/auth_page.dart';
import 'package:gerenciamento_estados/pages/product_overview_page.dart';
import 'package:gerenciamento_estados/providers/auth.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        
        return auth.isAuth ? ProductsOverviewPage() : AuthPage();
      },
    );
  }
}
