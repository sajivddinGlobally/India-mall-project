import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/pretty.dio.dart';
import 'package:shopping_app/search/allProductModel.dart/allProductModel.dart';
import 'package:shopping_app/search/service/allProductService.dart';

final allProductProvider = FutureProvider<List<AllProductModel>>((ref) async {
  final allproduct = AllProductService(await createDio());
  return allproduct.allProduct();
});

final particularProviderController =
    FutureProvider.family<AllProductModel, String>((ref, id) async {
      final particuler = AllProductService(await createDio());
      return particuler.particularProduct(id);
    });
final searchTextProvider = StateProvider<String>((ref) => '');
  