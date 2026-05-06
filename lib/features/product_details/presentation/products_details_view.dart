import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meadowkart_task/features/carts/presentation/provider/cart_provider.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/presentation/provider/favourite_provider.dart';

class ProductsDetailsView extends ConsumerWidget {
  final ProductEntity product;

  const ProductsDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(favouriteProvider).contains(product.id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7E57C2), Color(0xFF6750A4)],
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6750A4).withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color: Colors.white, size: 20.sp),
                          SizedBox(width: 8.w),
                          const Text('Added to cart!'),
                        ],
                      ),
                      backgroundColor: const Color(0xFF6750A4),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 20.sp),
                      SizedBox(width: 8.w),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
            stops: [0.0, 0.12, 0.25, 0.4],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image card
                Container(
                  margin: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFEDE7F6),
                        Colors.deepPurple.shade50,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withValues(alpha: 0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Hero(
                            tag: 'product_${product.id}',
                            child: Image.network(
                              product.image,
                              height: 260.h,
                              width: double.maxFinite,
                              fit: BoxFit.contain,
                              errorBuilder: (_, _, _) => Center(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  size: 80.sp,
                                  color: Colors.deepPurple.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Favourite button
                      Positioned(
                        top: 12.h,
                        right: 12.w,
                        child: GestureDetector(
                          onTap: () => ref
                              .read(favouriteProvider.notifier)
                              .toggleFavourite(product.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              gradient: isFav
                                  ? LinearGradient(
                                      colors: [
                                        Colors.pink.shade400,
                                        Colors.red.shade400,
                                      ],
                                    )
                                  : null,
                              color: isFav ? null : Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: isFav
                                      ? Colors.pink.withValues(alpha: 0.3)
                                      : Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border_rounded,
                              color: isFav ? Colors.white : Colors.deepPurple.shade300,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Details card
                Container(
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withValues(alpha: 0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category chip
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade50,
                                const Color(0xFFE8EAF6),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            product.category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF5C6BC0),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        // Title
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            color: const Color(0xFF1A1A2E),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Price + Rating row
                        Row(
                          children: [
                            // Price
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF5C6BC0),
                              ),
                            ),
                            const Spacer(),
                            // Rating container
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amber.shade400,
                                    Colors.orange.shade400,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withValues(alpha: 0.25),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star_rounded, color: Colors.white, size: 18.sp),
                                  SizedBox(width: 4.w),
                                  Text(
                                    product.rating.rate.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '(${product.rating.count})',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withValues(alpha: 0.85),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        // Divider
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.withValues(alpha: 0.05),
                                Colors.deepPurple.withValues(alpha: 0.15),
                                Colors.deepPurple.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Description header
                        Row(
                          children: [
                            Container(
                              width: 4.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF7E57C2), Color(0xFF6750A4)],
                                ),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1A1A2E),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom padding so content doesn't hide behind CTA
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
