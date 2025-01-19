import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  static saveUserToLocal(User user) {

  }

  Future<void> saveToLocal(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
    print(prefs.get('user'));
  }

  User? load() {
    loadUserFromLocal();
    return _user;
  }

  Future<void> loadUserFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      _user = User.fromJson(jsonDecode(userData));
      notifyListeners();
    }
  }

  remove() {
    clearUser();
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    _user = null;
    notifyListeners();
  }
}
