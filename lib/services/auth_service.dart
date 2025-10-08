import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'current_user';

  static Future<List<User>> _getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getStringList(_usersKey) ?? [];
    return usersJson.map((json) => User.fromJson(jsonDecode(json))).toList();
  }

  static Future<void> _saveUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = users.map((user) => jsonEncode(user.toJson())).toList();
    await prefs.setStringList(_usersKey, usersJson);
  }

  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_currentUserKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  static Future<void> setCurrentUser(User? user) async {
    final prefs = await SharedPreferences.getInstance();
    if (user != null) {
      await prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
    } else {
      await prefs.remove(_currentUserKey);
    }
  }

  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final users = await _getUsers();

    // Verificar se o email já existe
    if (users.any((user) => user.email == email)) {
      return false;
    }

    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      password: password,
      createdAt: DateTime.now(),
    );

    users.add(newUser);
    await _saveUsers(users);
    return true;
  }

  static Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    final users = await _getUsers();

    try {
      final user = users.firstWhere((user) => user.email == email);
      if (user.password == password) {
        await setCurrentUser(user);
        return user;
      } else {
        // Password incorrect
        return null;
      }
    } catch (e) {
      // User not found
      return null;
    }
  }

  static Future<bool> emailExists(String email) async {
    final users = await _getUsers();
    return users.any((user) => user.email == email);
  }

  static Future<void> logout() async {
    await setCurrentUser(null);
  }

  static Future<void> updateUser(User user) async {
    final users = await _getUsers();
    final index = users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      users[index] = user;
      await _saveUsers(users);
      await setCurrentUser(user);
    }
  }
}
