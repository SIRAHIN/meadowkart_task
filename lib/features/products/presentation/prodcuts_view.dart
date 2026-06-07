import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meadowkart_task/core/router/router_manager.dart';
import 'package:meadowkart_task/features/carts/presentation/provider/cart_provider.dart';
import 'package:meadowkart_task/features/products/presentation/provider/fetch_products_provider.dart';
import 'package:meadowkart_task/features/products/presentation/widget/product_card.dart';

class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});

  @override
  ConsumerState<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = ref.watch(productsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Discover'),
        centerTitle: true,
        
        actions: [
           DropdownButton(
            value: ref.watch(productsProvider).asData?.value.dropdownValue ?? 'all',
             underline: const SizedBox.shrink(),
             icon: Icon(Icons.more_vert, color: Colors.white, size: 22.sp),
            items: const [
          DropdownMenuItem(
            value: 'all',
            child: Text('All'),
          ),
          DropdownMenuItem(
            value: 'men',
            child: Text('Men'),
          ),
          DropdownMenuItem(
            value: 'women',
            child: Text('Women'),
          ),
        ], onChanged: (value) {
          ref.read(productsProvider.notifier).filterProductsByCategory(value!);
        }),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () => context.push(cartPath),
              ),
              Positioned(
                right: 4.w,
                top: 4.h,
                child: Consumer(
                  builder: (context, ref, _) {
                    final count = ref.watch(cartProvider).fold<int>(
                          0,
                          (sum, item) => sum + item.quantity,
                        );
                    if (count == 0) return const SizedBox.shrink();
                    return Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(minWidth: 16.r, minHeight: 16.r),
                      child: Text(
                        '$count',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],

      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6750A4),
              Color(0xFF7E57C2),
              Color(0xFFB39DDB),
              Color(0xFFF5F3FF),
            ],
            stops: [0.0, 0.15, 0.3, 0.45],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Greeting
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 4.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find your style ✨',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white.withValues(alpha: 0.85),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Search bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      ref.read(productsProvider.notifier).filterProducts(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                      ),
                      prefixIcon: Icon(Icons.search_rounded, color: Colors.deepPurple.shade300, size: 22.sp),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear_rounded, color: Colors.grey.shade500),
                              onPressed: () {
                                _searchController.clear();
                                ref.read(productsProvider.notifier).filterProducts('');
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                  ),
                ),
              ),
              // Products grid
              Expanded(
                child: filteredProducts.when(
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple.shade200,
                      strokeWidth: 3,
                    ),
                  ),
                  error: (error, stack) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline_rounded, size: 48.sp, color: Colors.deepPurple.shade200),
                        SizedBox(height: 12.h),
                        Text(
                          error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, color: Colors.deepPurple.shade300),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton.icon(
                          onPressed: () => ref.read(productsProvider.notifier).retryProducts(),
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Retry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6750A4),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  data: (products) {
                    if (products.filteredProducts.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off_rounded, size: 48.sp, color: Colors.deepPurple.shade200),
                            SizedBox(height: 12.h),
                            Text(
                              'No products found',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.deepPurple.shade300,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return RefreshIndicator(
                      color: const Color(0xFF6750A4),
                      onRefresh: () async {
                        ref.invalidate(productsProvider);
                      },
                      child: GridView.builder(
                        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 14.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemCount: products.filteredProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: products.filteredProducts[index],);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
