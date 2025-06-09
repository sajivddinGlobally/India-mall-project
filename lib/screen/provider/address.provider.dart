

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/Cart/service/cartService.dart';
import 'package:shopping_app/config/pretty.dio.dart';
import 'package:shopping_app/screen/models/adressModel.model.dart';

final addressProvider = FutureProvider<AdressListModel>((ref) async {
  final serive = CartService(await createDio());
  return await serive.getAdress();
});