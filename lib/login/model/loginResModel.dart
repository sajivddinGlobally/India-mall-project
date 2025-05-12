// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String status;
    String message;
    User user;

    LoginResModel({
        required this.status,
        required this.message,
        required this.user,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    String phone;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
    };
}
