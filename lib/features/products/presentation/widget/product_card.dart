import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meadowkart_task/core/router/router_manager.dart';
import 'package:meadowkart_task/features/products/domain/entity/product_entity.dart';
import 'package:meadowkart_task/features/products/presentation/provider/fetch_products_provider.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
 

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.push('$productsViewPath/$productDetailsPath', extra: product),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFFAF5FF)],
          ),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withValues(alpha: 0.10),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.deepPurple.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.deepPurple.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFEDE7F6),
                            Colors.deepPurple.shade50,
                          ],
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                      child: Hero(
                        tag: 'product_${product.id}',
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, _, _) => Center(
                            child: Icon(
                              Icons.broken_image_rounded,
                              size: 40.sp,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Discount-style rating badge
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.amber.shade400,
                              Colors.orange.shade400,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withValues(alpha: 0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 12.sp,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              product.rating.rate.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Favourite button
                    Consumer(
                      builder: (context, ref, child) {
                        final isFav =
                            ref
                                .watch(productsProvider)
                                .value
                                ?.favoriteProductIds
                                .contains(product.id) ??
                            false;
                        return Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: GestureDetector(
                            onTap: () => ref
                                .read(productsProvider.notifier)
                                .toggleFavorite(product.id),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                gradient: isFav
                                    ? LinearGradient(
                                        colors: [
                                          Colors.pink.shade400,
                                          Colors.red.shade400,
                                        ],
                                      )
                                    : null,
                                color: isFav
                                    ? null
                                    : Colors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: isFav
                                        ? Colors.pink.withValues(alpha: 0.3)
                                        : Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: isFav
                                    ? Colors.white
                                    : Colors.deepPurple.shade300,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Info section
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category chip
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 2.5.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade50,
                              const Color(0xFFE8EAF6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 7.5.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF5C6BC0),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      // Title
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: const Color(0xFF1A1A2E),
                        ),
                      ),
                      const Spacer(),
                      // Price and add button row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF5C6BC0),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF7E57C2), Color(0xFF6750A4)],
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF6750A4,
                                  ).withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.add_rounded,
                              size: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
