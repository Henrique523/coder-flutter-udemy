import 'package:chat_firebase/components/message_bubble.dart';
import 'package:chat_firebase/core/models/chat_message.dart';
import 'package:chat_firebase/core/services/auth/auth_service.dart';
import 'package:chat_firebase/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: const Text('Sem dados. Vamos conversar?'),
          );
        }

        final msgs = snapshot.data!;
        return ListView.builder(
          reverse: true,
          itemCount: msgs.length,
          itemBuilder: (ctx, index) => MessageBubble(
            key: ValueKey(msgs[index].id),
            message: msgs[index],
            belongsToCurrentUser: msgs[index].userId == currentUser?.id,
          ),
        );
      },
    );
  }
}
