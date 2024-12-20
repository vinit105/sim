import 'package:flutter/material.dart';

Color black = Colors.black26;
Color themeColor = Colors.purple;
Color t = Colors.red;
String? emailValidate(String? text) {
  if (text == null || text.isEmpty) {
    return "Email is required";
  }
  if (!text.contains("@")) {
    return "Enter a valid Email";
  }
  return null;
}

String? passwordValidate(String? text) {
  if (text == null || text.isEmpty) {
    return "Password is required";
  }
  if (text.trim().length < 6) {
    return "Minimum 6 Characters are required";
  }
  return null;
}

String? confirmValidate(
    String? text, String firstInputPassword, String secondInputPassword) {
  if (text == null || text.isEmpty) {
    return "Password is required";
  }
  if (text.length < 5) {
    return "Minimum 6 Characters are required";
  }
  if (text.isNotEmpty &&
      secondInputPassword.isNotEmpty &&
      secondInputPassword != text) {
    return "Password does not match";
  }
  return null;
}
