import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/config/pretty.dio.dart';
import 'package:shopping_app/login/model/loginBodyModel.dart';
import 'package:shopping_app/login/service/login.state.dart';
import 'package:shopping_app/login/service/loginService.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginIntial());

  // login method
  Future<void> login(LoginBodyModel body) async {
    log("Login precess started");

    try {
      state = LoginLoading();

      //initial login and login service
      final dio = await createDio();
      final loginservice = LoginService(dio);

      // call the login api
      final response = await loginservice.login(body);

      var box = Hive.box("data");
      await box.put("id", response.user.id.toString());
      await box.put("name", response.user.name);
      await box.put("email", response.user.email);
      
      //set state the success to the response
      state = LoginSuccess(response);
      log("Login Successfull :${response.toString()}");
    } catch (e) {
      // handle error and set the state error
      state = LoginError(e.toString());

      log("Login Failed : ${e.toString()}");
    }
  }
}

// statenotifier provider for logincontroller
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
      (ref) => LoginController(),
    );
