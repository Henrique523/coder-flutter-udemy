import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:chat_firebase/core/models/chat_user.dart';
import '../auth_service.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
  });

  ChatUser? get currentUser {
    return _currentUser;
  }

  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  Future<void> signup(String nome, String email, File? image) async {
  }

  Future<void> login(String email, String password) async {
  }

  Future<void> logout() async {
  }
}
