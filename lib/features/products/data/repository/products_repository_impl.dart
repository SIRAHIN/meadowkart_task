import 'package:dartz/dartz.dart';
import 'package:meadowkart_task/core/failuer/error_response/error_response.dart';
import 'package:meadowkart_task/features/products/data/datasource/product_remote_data_source/products_remote_data_source.dart';
import 'package:meadowkart_task/features/products/data/model/product_model/product_model.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<ErrorResponse, List<ProductEntity>>> getProducts() async {
    final result = await productsRemoteDataSource.getProducts();
    return result.fold(
      (error) => left(error),
      (products) => right(products.map((e) => e.toEntity()).toList()),
    );
  }
}
