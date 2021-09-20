import 'dart:io';

import 'package:chat_firebase/core/models/chat_user.dart';
import 'package:chat_firebase/core/services/auth/mock/auth_mock_service.dart';

abstract class AuthService {
  ChatUser? get currentUser;
  Stream<ChatUser?> get userChanges;

  Future<void> signup(String nome, String email, File? image);
  Future<void> login(String email, String password);
  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
  }
}