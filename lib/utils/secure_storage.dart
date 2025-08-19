import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _userKey = 'user_data';

  Future<void> storeUser(User user) async {
    await _storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    final userData = await _storage.read(key: _userKey);
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  Future<void> clearUser() async {
    await _storage.delete(key: _userKey);
  }
}
