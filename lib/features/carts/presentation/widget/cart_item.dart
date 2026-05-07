import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meadowkart_task/features/carts/presentation/provider/cart_provider.dart';

class CartItemCard extends ConsumerWidget {
  final CartItem item;

  const CartItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(item.product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) =>
          ref.read(cartProvider.notifier).removeFromCart(item.product.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(Icons.delete_outline_rounded,
            color: Colors.red.shade400, size: 24.sp),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color(0xFF6750A4).withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          children: [
            // Product image
            Container(
              width: 72.w,
              height: 72.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Hero(
                tag: 'product-${item.product.id}',
                child: Image.network(
                  item.product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey.shade400,
                    size: 28.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.w),
            // Title + Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '\$${item.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF6750A4),
                    ),
                  ),
                ],
              ),
            ),
            // Quantity controls
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  _QtyButton(
                    icon: Icons.remove_rounded,
                    onTap: () => ref
                        .read(cartProvider.notifier)
                        .decreaseQuantity(item.product.id),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SizedBox(
                      width: 24.w,
                      child: Center(
                        child: Text(
                          '${item.quantity}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _QtyButton(
                    icon: Icons.add_rounded,
                    onTap: () => ref
                        .read(cartProvider.notifier)
                        .increaseQuantity(item.product.id),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Padding(
          padding: EdgeInsets.all(6.w),
          child: Icon(icon, size: 18.sp, color: const Color(0xFF6750A4)),
        ),
      ),
    );
  }
}
