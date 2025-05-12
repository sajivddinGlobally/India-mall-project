import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/login/model/loginBodyModel.dart';
import 'package:shopping_app/login/model/loginResModel.dart';

part 'loginService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/custom-api/v1/login')
  Future<LoginResModel> login(@Body() LoginBodyModel body);
}
