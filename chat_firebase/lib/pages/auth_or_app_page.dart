import 'package:chat_firebase/core/models/chat_user.dart';
import 'package:chat_firebase/core/services/auth/auth_service.dart';
import 'package:chat_firebase/core/services/notification/chat_noticiation_service.dart';
import 'package:chat_firebase/pages/auth_page.dart';
import 'package:chat_firebase/pages/chat_page.dart';
import 'package:chat_firebase/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class AuthOrAppPage extends StatelessWidget {
  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    Provider.of<ChatNotificationService>(
      context,
      listen: false,
    ).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          return StreamBuilder<ChatUser?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              } else {
                return snapshot.hasData ? ChatPage() : AuthPage();
              }
            },
          );
        }
      },
    );
  }
}
