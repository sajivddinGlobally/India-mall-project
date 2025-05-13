import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/category/model/categoryModel.dart';

part 'categoryService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET('/indiamall/v1/categories')
  Future<List<CategorModel>> getCategory();
}
