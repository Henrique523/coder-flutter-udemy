import 'package:chat_firebase/core/services/auth/auth_service.dart';
import 'package:chat_firebase/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageControler = TextEditingController();

  String _enteredMessage = '';
  

  Future<void> _sendMessage() async {
   final user = AuthService().currentUser;


   if(user != null) {
      await ChatService().save(_enteredMessage, user);
      _messageControler.clear();
   }

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enviar mensagem...',
              ),
              controller: _messageControler,
              onChanged: (msg) => setState(() => _enteredMessage = msg),
              onSubmitted: (_) {
                if (_enteredMessage.trim().isNotEmpty) {
                  _sendMessage();
                }
              },
            ),
          ),
        ),
        IconButton(
          onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
