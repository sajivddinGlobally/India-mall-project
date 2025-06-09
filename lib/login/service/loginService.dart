import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/login/model/loginBodyModel.dart';
import 'package:shopping_app/login/model/loginResModel.dart';
import 'package:shopping_app/login/model/tokenBodyModel.dart';
import 'package:shopping_app/login/model/tokenResModel.dart';

part 'loginService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/custom-api/v1/login')
  Future<LoginResModel> login(@Body() LoginBodyModel body);
  @POST('/jwt-auth/v1/token')
  Future<TokenResModel> getToken(@Body() TokenBodyModel body);
}
