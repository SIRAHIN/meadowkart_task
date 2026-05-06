import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/failuer/error_response/error_response.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/domain/repository/products_repository.dart';


// Fetch products usecase provider
final fetchProductsUsecaseProvider = Provider<FetchProductsUsecase>((ref) {
  return FetchProductsUsecase(
    productsRepository: ref.read(productsRepositoryProvider),
  );
});

class FetchProductsUsecase {

  final ProductsRepository productsRepository;

  FetchProductsUsecase({required this.productsRepository});

  Future<Either<ErrorResponse, List<ProductEntity>>> call() async {
    return await productsRepository.getProducts();
  }
}
