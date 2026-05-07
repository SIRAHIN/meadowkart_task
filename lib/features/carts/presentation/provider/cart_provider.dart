import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/features/carts/data/datasource/cart_local_datasource/cart_local_data_source.dart';
import 'package:meadowkart_task/features/carts/data/model/cart_model/cart_item_model.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';



final cartProvider = NotifierProvider<CartNotifier, List<CartItemModel>>(
  CartNotifier.new,
);

final cartLocalDataSourceProvider = Provider<CartLocalDataSource>(
  (ref) => CartLocalDataSourceImpl(),
);

class CartNotifier extends Notifier<List<CartItemModel>> {

  late CartLocalDataSource _cartLocalDataSource;

  @override
  List<CartItemModel> build() {
    _cartLocalDataSource = ref.watch(cartLocalDataSourceProvider);
    return _cartLocalDataSource.getCartProducts();
  }

  // Add a product to the cart \\
  void addToCart(ProductEntity product) {
    for (var item in state) {
      if (item.product.id == product.id) {
        print("the iffffffffffff ");
        return;
      }
    }
    print("the elseeeeeeeee ");
    _cartLocalDataSource.addToCart(CartItemModel(product: product, quantity: 1));
    state = [...state, CartItemModel(product: product, quantity: 1)];
  }

  // Increase the quantity of a product in the cart \\
  void increaseQuantity(int productId) {
    for (var item in state){
      if(item.product.id == productId){
        int index = state.indexOf(item);
        state[index] = CartItemModel(product: item.product, quantity: item.quantity + 1);
        state = [...state];
        _cartLocalDataSource.updateCartItem(productId, item.quantity + 1);
      } 
    }
  }

  // Decrease the quantity of a product in the cart \\
  void decreaseQuantity(int productId) {
    for (var item in state){
      if(item.product.id == productId){
        // if the quantity is 1 then remove the product from the cart \\
        if(item.quantity <= 1) {
          removeFromCart(productId);
          _cartLocalDataSource.removeFromCart(productId);
        } else {
          // here i am updating the quantity by getting the index of the product in the cart \\
          int index = state.indexOf(item);
          state[index] = CartItemModel(product: item.product, quantity: item.quantity - 1);
          state = [...state];
          _cartLocalDataSource.updateCartItem(productId, item.quantity - 1);
        }
      } 
    }
  }

  // Remove a product from the cart \\
  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
     _cartLocalDataSource.removeFromCart(productId);
  }

  // get total price of all the products in the cart \\
  double get totalAmount =>
      state.fold(0.0, (sum, item) => sum + item.totalPrice);

  // get total number of products in the cart \\
  int get itemCount => state.fold(0, (sum, item) => sum + item.quantity);

  // clear the cart \\
  void clearCart() {
    state = [];
    _cartLocalDataSource.clearCart();
  }
}
