import 'package:go_router/go_router.dart';
import 'package:meadowkart_task/features/carts/presentation/carts_view.dart';
import 'package:meadowkart_task/features/checkout/presentation/checkout_view.dart';
import 'package:meadowkart_task/features/product_details/presentation/products_details_view.dart';
import 'package:meadowkart_task/features/products/presentation/prodcuts_view.dart';
import 'package:meadowkart_task/features/splash/presentation/splash_view.dart';

class RouteManager {
  static final GoRouter router = GoRouter(
    initialLocation: splashViewPath,
    routes: [
      GoRoute(
        name: splashViewName,
        path: splashViewPath,
        builder: (context, state) => const SplashView(),
      ),

      // Products View nested routes is product details view
      GoRoute(
        name: productsViewName,
        path: productsViewPath,
        builder: (context, state) => const ProductsView(),
        routes: [
          GoRoute(
            name: productDetailsName,
            path: productDetailsPath,
            builder: (context, state) => const ProductsDetailsView(),
          ),
        ],
      ),

      // Cart View nested routes is checkout view 
      GoRoute(
        name: cartName,
        path: cartPath,
        builder: (context, state) => const CartsView(),
        routes: [
          GoRoute(
            name: checkoutName,
            path: checkoutPath,
            builder: (context, state) => const CheckoutView(),
          ),
        ],
      ),
    ],
  );
}

// Routes Paths
const String splashViewPath = '/';
const String productsViewPath = '/productsView';
const String productDetailsPath = 'productDetailsPath';
const String cartPath = '/cartPath';
const String checkoutPath = 'checkoutPath';

// Routes Names
const String splashViewName = 'splashView';
const String productsViewName = 'productsView';
const String productDetailsName = 'productDetailsView';
const String cartName = 'cartView';
const String checkoutName = 'checkoutView';
