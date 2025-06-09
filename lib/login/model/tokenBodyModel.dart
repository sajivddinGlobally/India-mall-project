// To parse this JSON data, do
//
//     final tokenBodyModel = tokenBodyModelFromJson(jsonString);

import 'dart:convert';

TokenBodyModel tokenBodyModelFromJson(String str) => TokenBodyModel.fromJson(json.decode(str));

String tokenBodyModelToJson(TokenBodyModel data) => json.encode(data.toJson());

class TokenBodyModel {
    String username;
    String password;

    TokenBodyModel({
        required this.username,
        required this.password,
    });

    factory TokenBodyModel.fromJson(Map<String, dynamic> json) => TokenBodyModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
