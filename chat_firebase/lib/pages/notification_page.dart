import 'package:chat_firebase/core/services/notification/chat_noticiation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notificações'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(items[index].title),
          subtitle: Text(items[index].body),
          onTap: () => service.remove(index),
        ),
      ),
    );
  }
}
