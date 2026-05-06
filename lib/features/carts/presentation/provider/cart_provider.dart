import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';

class CartItem {
  final ProductEntity product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;
}

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(
  CartNotifier.new,
);

class CartNotifier extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => [];

  // Add a product to the cart \\
  void addToCart(ProductEntity product) {
    for (var item in state) {
      if (item.product.id == product.id) {
        print("the iffffffffffff ");
        return;
      }
    }
    print("the elseeeeeeeee ");
    state = [...state, CartItem(product: product, quantity: 1)];
  }

  // Increase the quantity of a product in the cart \\
  void increaseQuantity(int productId) {
    for (var item in state){
      if(item.product.id == productId){
        int index = state.indexOf(item);
        state[index] = CartItem(product: item.product, quantity: item.quantity + 1);
        state = [...state];
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
        } else {
          // here i am updating the quantity by getting the index of the product in the cart \\
          int index = state.indexOf(item);
          state[index] = CartItem(product: item.product, quantity: item.quantity - 1);
          state = [...state];
        }
      } 
    }
  }

  // Remove a product from the cart \\
  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  // get total price of all the products in the cart \\
  double get totalAmount =>
      state.fold(0.0, (sum, item) => sum + item.totalPrice);

  // get total number of products in the cart \\
  int get itemCount => state.fold(0, (sum, item) => sum + item.quantity);

  // clear the cart \\
  void clearCart() => state = [];
}
