import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

class NetworkService {
  static const String baseUrl = "https://reqres.in";
  static const String login = "/api/login";
  static const String register = "/api/register";

  static Future<void> getLoginData(String email, String password) async {
    String url = baseUrl + login;
    final jsonBody = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(jsonBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        User usr = User(
            email: email, password: password, token: responseData['token']);
        UserProvider.saveUserToLocal(usr);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<void> getRegisterData(String email, String password) async {
    String registerUrl = baseUrl + register;
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
