// To parse this JSON data, do
//
//     final requestPostAuthLogin = requestPostAuthLoginFromJson(jsonString);

import 'dart:convert';

RequestPostAuthLogin requestPostAuthLoginFromJson(String str) => RequestPostAuthLogin.fromJson(json.decode(str));

String requestPostAuthLoginToJson(RequestPostAuthLogin data) => json.encode(data.toJson());

class RequestPostAuthLogin {
  RequestPostAuthLogin({
    this.userId,
    this.password,
  });

  int? userId;
  String? password;

  RequestPostAuthLogin copyWith({
    int? userId,
    String? password,
  }) =>
      RequestPostAuthLogin(
        userId: userId ?? this.userId,
        password: password ?? this.password,
      );

  factory RequestPostAuthLogin.fromJson(Map<String, dynamic> json) => RequestPostAuthLogin(
    userId: json["userId"] == null ? null : json["userId"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "password": password == null ? null : password,
  };
}
