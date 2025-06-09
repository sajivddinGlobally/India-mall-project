import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_app/search/allProductModel.dart/allProductModel.dart';

part 'allProductService.g.dart';

@RestApi(baseUrl: 'https://indiamall.live/wp-json')
abstract class AllProductService {
  factory AllProductService(Dio dio, {String baseUrl}) = _AllProductService;

  @GET('/indiamall/v1/products')
  Future<List<AllProductModel>> allProduct();

  @GET('/indiamall/v1/products/{id}')
  Future<AllProductModel> particularProduct(@Path() String id);


}
