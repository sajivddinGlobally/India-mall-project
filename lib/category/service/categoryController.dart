import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/category/model/categoryModel.dart';
import 'package:shopping_app/category/model/productsbyCategoryId.dart';
import 'package:shopping_app/category/service/categoryService.dart';
import 'package:shopping_app/config/pretty.dio.dart';

final categoryController = FutureProvider<List<CategorModel>>((ref) async {
  final categorservice = CategoryService(await createDio());
  return categorservice.getCategory();
});

final productsByCategoryid = FutureProvider.family<List<ProductByCategoryID>, String>((ref, id) async {
  final service = CategoryService(await createDio());
  return service.getProductsByCategoryId(id);
});