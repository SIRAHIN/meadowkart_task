// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meadowkart_task/features/products/data/datasource/product_local_data_soruce/product_local_data_source.dart';
// import 'package:meadowkart_task/features/products/data/model/product_favourite_model/product_favourite_model.dart';

// final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
//   return ProductLocalDataSourceImpl();
// });

// final favouriteProvider =
//     NotifierProvider<FavouriteNotifier, Set<int>>(FavouriteNotifier.new);

// class FavouriteNotifier extends Notifier<Set<int>> {
//   @override
//   Set<int> build() {
//     final ds = ref.read(productLocalDataSourceProvider);
//     return ds.getFavouriteProducts().map((e) => e.productId).toSet();
//   }

//   // Toggle Favourite
//   Future<void> toggleFavourite(int productId) async {
//     final ds = ref.read(productLocalDataSourceProvider);
//     await ds.toggleFavourite(ProductFavouriteModel(productId: productId));
//     state = ds.getFavouriteProducts().map((e) => e.productId).toSet();
//   }
// }
