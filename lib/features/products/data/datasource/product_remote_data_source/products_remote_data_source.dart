import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/endpoints/api_endpoints.dart';
import 'package:meadowkart_task/core/failuer/error_response/error_response.dart';
import 'package:meadowkart_task/core/failuer/failuer_handler/failuer_handler.dart';
import 'package:meadowkart_task/core/network/api_client.dart';
import 'package:meadowkart_task/features/products/data/model/product_model/product_model.dart';

// Products remote data source provider
final productsRemoteDataSourceProvider =
    Provider<ProductsRemoteDataSource>((ref) {
  return ProductsRemoteDataSource(
    apiClient: ref.read(apiClientProvider),
  );
});

class ProductsRemoteDataSource {
  final ApiClient _apiClient;

  ProductsRemoteDataSource({required ApiClient apiClient}):_apiClient = apiClient;

   Future<Either<ErrorResponse, List<ProductModel>>> getProducts()async{
    try {
      Response response = await _apiClient.get(ApiEndpoints.getProducts);
      var result = (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
