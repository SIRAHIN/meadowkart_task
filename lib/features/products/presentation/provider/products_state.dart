import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';

class ProductsState {
  final List<ProductEntity> products;
  final List<ProductEntity> filteredProducts;
  final List<int> favoriteProductIds;
  final String? dropdownValue;

  ProductsState({required this.products, required this.filteredProducts, required this.favoriteProductIds, this.dropdownValue});

  // copyWith method to create a new instance of ProductsState with updated values
  ProductsState copyWith({
    List<ProductEntity>? products,
    List<ProductEntity>? filteredProducts,
    List<int>? favoriteProductIds,
    String? dropdownValue,
  }) {
    return ProductsState(
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      favoriteProductIds: favoriteProductIds ?? this.favoriteProductIds,
      dropdownValue: dropdownValue ?? this.dropdownValue,
    );
  }
}
