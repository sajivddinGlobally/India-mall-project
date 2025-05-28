import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/Cart/model/addToCartBodyModel.dart';
import 'package:shopping_app/Cart/model/addToCartResModel.dart';
import 'package:shopping_app/Cart/model/cartModel.dart';
import 'package:shopping_app/Cart/service/cartService.dart';
import 'package:shopping_app/config/pretty.dio.dart';

final cartProvider = FutureProvider<CartModel>((ref) async {
  final cartservice = CartService(await createDio());
  return cartservice.cart();
});

final addToCartProvider =
    FutureProvider.family<AddToCartResModel, AddToCartBodyModel>((
      ref,
      body,
    ) async {
      final addToCartService = CartService(await createDio());
      return addToCartService.addToCart(body);
    });





