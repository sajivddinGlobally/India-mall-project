import 'dart:developer';
import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:hive_flutter/hive_flutter.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopping_app/login/login.page.dart';

Dio createDio() {
  final dio = Dio();
<<<<<<< HEAD
  var box = Hive.box("data");
  final token = box.get("token");
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token != null) {
          options.headers['Authorization'] =
              'Bearer $token';
        }
        return handler.next(options);
      },
    ),
  );
=======

>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  var box = Hive.box("data");
  var token = box.get("token");
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dio.interceptors.add(
    InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   options.headers.addAll({
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $token',
      //     if (token != null) 'Authorization': 'Bearer $token',
      //   });
      //   handler.next(options);
      // },
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json';
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] =
              'Bearer $token'; // ✅ Add only if token exists
        }
        handler.next(options);
      },

      // onResponse: (response, handler) {
      //   handler.next(response);
      // },
      onResponse: (response, handler) {
        handler.next(response);
      },

      // onError: (DioException e, handler) {
      //   //handler.next(error);
      //   log('Unauthorized error: ${e.message}');
      //   if (e.response?.statusCode == 403) {
      //     navigatorKey.currentState?.push(
      //       CupertinoPageRoute(builder: (context) => LoginPage()),
      //     );
      //     return;
      //   } else {
      //     handler.next(e);
      //   }
      // },
      onError: (DioException e, handler) {
        log('Unauthorized error: ${e.message}');
        if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
          navigatorKey.currentState?.push(
            CupertinoPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          handler.next(e);
        }
      },
    ),
  );
  return dio;
}
