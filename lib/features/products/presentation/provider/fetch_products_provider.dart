import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/features/products/data/datasource/product_local_data_soruce/product_local_data_source.dart';
import 'package:meadowkart_task/features/products/data/model/product_favourite_model/product_favourite_model.dart';
import 'package:meadowkart_task/features/products/domain/repository/products_repository.dart';
import 'package:meadowkart_task/features/products/domain/usecase/fetch_products_usecase.dart';
import 'package:meadowkart_task/features/products/presentation/provider/products_state.dart';

final productsProvider =
    AsyncNotifierProvider<FetchProductsProvider, ProductsState>(
      FetchProductsProvider.new,
    );

// Products usecase provider
final fetchProductsUsecaseProvider = Provider<FetchProductsUsecase>((ref) {
  return FetchProductsUsecase(
    productsRepository: ref.read(productsRepositoryProvider),
  );
});

// Fetch Favorite Products Provider
final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
  return ProductLocalDataSourceImpl();
});

class FetchProductsProvider extends AsyncNotifier<ProductsState> {
  @override
  FutureOr<ProductsState> build() {
    return fetchProducts();
  }

  // Fetch Products
  Future<ProductsState> fetchProducts() async {
    state = AsyncLoading();

    final result = await ref.read(fetchProductsUsecaseProvider).call();

    final favoriteDb =  ref.read(productLocalDataSourceProvider);

    final favoriteProductIds = favoriteDb
        .getFavouriteProducts()
        .map((e) => e.productId)
        .toList();

    result.fold(
      (error) {
        state = AsyncError(
          error.message ?? 'Failed to fetch products',
          StackTrace.current,
        );
      },
      (products) {
        state = AsyncData(
          ProductsState(
            products: products,
            filteredProducts: products,
            favoriteProductIds: favoriteProductIds,
          ),
        );
      },
    );

    return state.value ??
        ProductsState(
          products: [],
          filteredProducts: [],
          favoriteProductIds: [],
        );
  }

  // Filter products by name
  void filterProducts(String query) {
    final currentState = state.value;

    if (currentState == null) return;

    // If the search query is empty, show all products
    if (query.isEmpty) {
      state = AsyncData(
        currentState.copyWith(filteredProducts: currentState.products),
      );
      return;
    }

    // Filter products based on the search query
    final filtered = currentState.products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.category.toLowerCase().contains(query.toLowerCase());
    }).toList();
    state = AsyncData(currentState.copyWith(filteredProducts: filtered));
  }

  // Toggle favorite product
  void toggleFavorite(int productId) {
    final currentState = state.value;

    if (currentState == null) return;

    final favoriteDb = ref.read(productLocalDataSourceProvider);

    favoriteDb.toggleFavourite(ProductFavouriteModel(productId: productId));

    final getUpdatedFavorites = favoriteDb
        .getFavouriteProducts()
        .map((e) => e.productId)
        .toList();

    state = AsyncData(
      currentState.copyWith(favoriteProductIds: getUpdatedFavorites),
    );
  }
}
