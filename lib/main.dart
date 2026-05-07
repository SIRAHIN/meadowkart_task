import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meadowkart_task/features/app.dart';
import 'package:meadowkart_task/features/carts/data/model/cart_model/cart_item_model.dart';
import 'package:meadowkart_task/features/products/data/model/product_favourite_model/product_favourite_model.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app orientation to portrait mode \\
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initHive();

  runApp(const App());
}

// Initialize Hive for local storage \\
Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductFavouriteModelAdapter());
  Hive.registerAdapter(CartItemModelAdapter());
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(RatingEntityAdapter());

  await Hive.openBox<ProductFavouriteModel>('favourites');
  await Hive.openBox<CartItemModel>('carts');
}
