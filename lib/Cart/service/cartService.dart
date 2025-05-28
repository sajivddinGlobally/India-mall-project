import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/Cart/model/cartModel.dart';
import 'package:shopping_app/Cart/model/checkout.model.dart';





@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @GET('/indiamall/v1/cart')
  Future<CartModel> cart();
  @POST('/indiamall/v1/checkout')
  Future<HttpResponse> checkout(@Body() CheckoutModel body);
}


