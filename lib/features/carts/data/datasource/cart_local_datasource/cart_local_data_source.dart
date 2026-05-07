import 'package:hive/hive.dart';
import 'package:meadowkart_task/features/carts/data/model/cart_model/cart_item_model.dart';

abstract class CartLocalDataSource {
  List<CartItemModel> getCartProducts();
  Future<void> addToCart(CartItemModel cartItem);
  Future<void> removeFromCart(int productId);
  Future<void> updateCartItem(int productId, int quantity);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  Box<CartItemModel>? _cartBox;

  Box<CartItemModel> get _box => _cartBox ??= Hive.box<CartItemModel>('carts');

  @override
  Future<void> addToCart(CartItemModel cartItem) {
    if (_box.containsKey(cartItem.product.id)) {
      return updateCartItem(cartItem.product.id, cartItem.quantity + 1);
    }
    return _box.put(cartItem.product.id, cartItem);
  }

  @override
  Future<void> clearCart() {
    return _box.clear();
  }

  @override
  List<CartItemModel> getCartProducts() {
    return _box.values.toList();
  }

  @override
  Future<void> removeFromCart(int productId) {
    return _box.delete(productId);
  }

  @override
  Future<void> updateCartItem(int productId, int quantity) {
    final cartItem = _box.get(productId);
    if (cartItem != null) {
      final updatedCartItem = cartItem.copyWith(quantity: quantity);
      return _box.put(productId, updatedCartItem);
    }
    return Future.error('Cart item not found');
  }
}