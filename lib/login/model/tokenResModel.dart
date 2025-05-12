// To parse this JSON data, do
//
//     final tokenResModel = tokenResModelFromJson(jsonString);

import 'dart:convert';

TokenResModel tokenResModelFromJson(String str) => TokenResModel.fromJson(json.decode(str));

String tokenResModelToJson(TokenResModel data) => json.encode(data.toJson());

class TokenResModel {
    String token;
    String userEmail;
    String userNicename;
    String userDisplayName;

    TokenResModel({
        required this.token,
        required this.userEmail,
        required this.userNicename,
        required this.userDisplayName,
    });

    factory TokenResModel.fromJson(Map<String, dynamic> json) => TokenResModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
    };
}
