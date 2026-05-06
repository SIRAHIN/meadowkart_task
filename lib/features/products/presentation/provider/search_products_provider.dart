import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/presentation/provider/fetch_products_provider.dart';

final searchProductsProvider =
    NotifierProvider<SearchProductsNotifier, AsyncValue<List<ProductEntity>>>(
  SearchProductsNotifier.new,
);

class SearchProductsNotifier
    extends Notifier<AsyncValue<List<ProductEntity>>> {
  @override
  AsyncValue<List<ProductEntity>> build() {
    //re-builds automatically when it changes
    return ref.watch(productsProvider);
  }

  // search products based on query 
  void searchProducts(String query) {
    final productsAsync = ref.read(productsProvider);
    state = productsAsync.whenData((products) {
      if (query.isEmpty) return products;
      return products
          .where((p) =>
              p.title.toLowerCase().contains(query.toLowerCase()) ||
              p.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
