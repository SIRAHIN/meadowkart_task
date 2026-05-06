import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/domain/repository/products_repository.dart';
import 'package:meadowkart_task/features/products/domain/usecase/fetch_products_usecase.dart';

final productsProvider =
    AsyncNotifierProvider<FetchProductsProvider, List<ProductEntity>>(
      FetchProductsProvider.new,
    );

// Products usecase provider
final fetchProductsUsecaseProvider = Provider<FetchProductsUsecase>((ref) {
  return FetchProductsUsecase(
    productsRepository: ref.read(productsRepositoryProvider),
  );
});

class FetchProductsProvider extends AsyncNotifier<List<ProductEntity>> {
  @override
  FutureOr<List<ProductEntity>> build() {
    return fetchProducts();
  }

  // Fetch Products
  Future<List<ProductEntity>> fetchProducts() async {
    state = AsyncLoading();

    final result = await ref.read(fetchProductsUsecaseProvider).call();

    result.fold(
      (error) {
        state = AsyncError(
          error.message ?? 'Failed to fetch products',
          StackTrace.current,
        );
      },
      (products) {
        state = AsyncData(products);
      },
    );

    return state.value ?? [];
  }
}
