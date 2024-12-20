import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String email;
  final String password;
  String? token;
  int? id;

  User({
    required this.email,
    required this.password,
    this.token,
    this.id,
  });

  User copyWith({
    String? email,
    String? password,
    String? token,
    int? id,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
        token: token ?? this.token,
        id: id ?? this.id,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "token": token,
        "id": id,
      };
}
