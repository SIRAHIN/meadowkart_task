import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/failuer/error_response/error_response.dart';
import 'package:meadowkart_task/features/products/data/datasource/product_remote_data_source/products_remote_data_source.dart';
import 'package:meadowkart_task/features/products/data/repository/products_repository_impl.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';


// Products repository provider
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepositoryImpl(
    productsRemoteDataSource:
        ref.read(productsRemoteDataSourceProvider),
  );
});

abstract class ProductsRepository {
  Future<Either<ErrorResponse, List<ProductEntity>>> getProducts();
}