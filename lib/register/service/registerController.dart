import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/login/login.page.dart';

class RegisterController {
  static Future<Map<String, dynamic>> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final Uri url = Uri.parse(
      'https://indiamall.live/wp-json/custom-api/v1/register',
    );

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({"Accept": "application/json"});

    request.fields.addAll({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    });

    try {
      final http.StreamedResponse response = await request.send();
      final ResponseBody = await response.stream.bytesToString();
      Map<String, dynamic> data = jsonDecode(ResponseBody);
      log(ResponseBody);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Your account was created")));
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
        return data;
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data['message'].toString())));
        throw Exception("Register Failed:${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Something went wrong :$e");
    }
  }
}
