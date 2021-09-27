import 'dart:async';

import 'package:chat_firebase/core/models/chat_message.dart';
import 'package:chat_firebase/core/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chat_service.dart';

class ChatFirebaseService implements ChatService {
  Stream<List<ChatMessage>> messagesStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store
        .collection('chat')
        .withConverter(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        )
        .orderBy('createdAt', descending: true)
        .snapshots();

    return snapshots.map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    final msg = ChatMessage(
      id: '',
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );

    final docRef = await store
        .collection('chat')
        .withConverter(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        )
        .add(msg);

    final doc = await docRef.get();
    return doc.data()!;
  }

  ChatMessage fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc, SnapshotOptions? options) {
    return ChatMessage(
      id: doc.id,
      text: doc['text'],
      createdAt: DateTime.parse(doc['createdAt']),
      userId: doc['userId'],
      userName: doc['userName'],
      userImageURL: doc['userImageURL'],
    );
  }

  Map<String, dynamic> toFirestore(ChatMessage msg, SetOptions? options) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.id,
      'userName': msg.userName,
      'userImageURL': msg.userImageURL,
    };
  }
}
