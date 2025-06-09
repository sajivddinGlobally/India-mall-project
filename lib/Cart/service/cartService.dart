import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/Cart/model/addToCartBodyModel.dart';
import 'package:shopping_app/Cart/model/addToCartResModel.dart';
import 'package:shopping_app/Cart/model/cartModel.dart';
import 'package:shopping_app/Cart/model/cartquantityUpdate,model.dart';
import 'package:shopping_app/account/model/order.lisr.dart';

import 'package:shopping_app/screen/models/addresBody.model.dart';
import 'package:shopping_app/screen/models/adressModel.model.dart';

part 'cartService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @GET('/indiamall/v1/cart')
  Future<CartModel> cart();
  @POST('/indiamall/v1/app-checkout-create-order')
  Future<HttpResponse> checkout();
  @POST('/indiamall/v1/cart')
  Future<AddToCartResModel> addToCart(@Body() AddToCartBodyModel body);
  @PUT('/indiamall/v1/cart/')
  Future<UpdateQuantityResponse> updateCart(@Body() UpdateQuantityBody body);
  @GET('/indiamall/v1/address')
  Future<AdressListModel> getAdress();
  @POST('/indiamall/v1/address')
  Future<HttpResponse> postAddress(@Body() AddressBodyModel body);
  @GET('/indiamall/v1/orders')
  Future<OrderListModel> getOrderList();
}
