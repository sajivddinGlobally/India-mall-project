

import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/Cart/service/cartService.dart';
import 'package:shopping_app/account/model/order.lisr.dart';

import 'package:shopping_app/config/pretty.dio.dart';

final  orderListProvider = FutureProvider<OrderListModel>((ref) async {
  final service = CartService(await createDio());
  return service.getOrderList();
});