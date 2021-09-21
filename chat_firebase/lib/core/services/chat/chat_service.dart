import 'package:chat_firebase/core/models/chat_message.dart';
import 'package:chat_firebase/core/models/chat_user.dart';
import 'package:chat_firebase/core/services/chat/implementations/chat_firebase_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    return ChatFirebaseService();
  }
}