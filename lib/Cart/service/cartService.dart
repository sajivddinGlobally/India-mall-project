import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/Cart/model/cartModel.dart';

part 'cartService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @GET('/indiamall/v1/cart')
  Future<CartModel> cart();
}
