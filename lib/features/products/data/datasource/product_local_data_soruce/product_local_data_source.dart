import 'package:hive_flutter/hive_flutter.dart';
import 'package:meadowkart_task/features/products/data/model/product_favourite_model/product_favourite_model.dart';



abstract class ProductLocalDataSource {
  Box<ProductFavouriteModel> get favouriteBox;
  Future<void> toggleFavourite(ProductFavouriteModel product);
  List<ProductFavouriteModel> getFavouriteProducts();
  bool isFavourite(int productId);
}


class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const String _boxName = 'favourites';


  @override
  Box<ProductFavouriteModel> get favouriteBox => Hive.box<ProductFavouriteModel>(_boxName);

  @override
  Future<void> toggleFavourite(ProductFavouriteModel product) async {
    if (isFavourite(product.productId)) {
      await favouriteBox.delete(product.productId);
    } else {
      await favouriteBox.put(product.productId, product);
    }
  }

  @override
  List<ProductFavouriteModel> getFavouriteProducts() {
    return favouriteBox.values.toList();
  }

  @override
  bool isFavourite(int productId) {
    return favouriteBox.containsKey(productId);
  }
}