import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meadowkart_task/core/router/router_manager.dart';
import 'package:meadowkart_task/features/carts/presentation/provider/cart_provider.dart';
import 'package:toastification/toastification.dart';

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});

  @override
  ConsumerState<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends ConsumerState<CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _placeOrder() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(cartProvider.notifier).clearCart();

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: const Text('Order Placed!'),
      description: const Text('Your order has been placed successfully.'),
      autoCloseDuration: const Duration(seconds: 3),
    );

    context.go(productsViewPath);
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final totalAmount = ref.read(cartProvider.notifier).totalAmount;
    final itemCount = ref.read(cartProvider.notifier).itemCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order summary card
                    _SectionCard(
                      icon: Icons.receipt_long_outlined,
                      title: 'Order Summary',
                      child: Column(
                        children: [
                          ...cart.map((item) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 42.w,
                                      height: 42.h,
                                      padding: EdgeInsets.all(6.w),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F3FF),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Hero(
                                        tag: 'product-${item.product.id}',
                                        child: Image.network(
                                          item.product.image,
                                          fit: BoxFit.contain,
                                          errorBuilder: (_, _, _) => Icon(
                                            Icons.image_not_supported_outlined,
                                            color: Colors.grey.shade400,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        item.product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'x${item.quantity}',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '\$${item.totalPrice.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF6750A4),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Divider(
                                color: const Color(0xFF6750A4)
                                    .withValues(alpha: 0.1)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total ($itemCount items)',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '\$${totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF6750A4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Shipping info card
                    _SectionCard(
                      icon: Icons.local_shipping_outlined,
                      title: 'Shipping Details',
                      child: Column(
                        children: [
                          _StyledField(
                            controller: _nameController,
                            label: 'Full Name',
                            icon: Icons.person_outline_rounded,
                            validator: (v) => v == null || v.trim().isEmpty
                                ? 'Please enter your name'
                                : null,
                          ),
                          SizedBox(height: 14.h),
                          _StyledField(
                            controller: _emailController,
                            label: 'Email Address',
                            icon: Icons.mail_outline_rounded,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(v)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 14.h),
                          _StyledField(
                            controller: _addressController,
                            label: 'Delivery Address',
                            icon: Icons.location_on_outlined,
                            maxLines: 3,
                            validator: (v) => v == null || v.trim().isEmpty
                                ? 'Please enter your address'
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom place order button
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 16.w, 20.w, 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: _placeOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6750A4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline_rounded, size: 18.sp),
                      SizedBox(width: 8.w),
                      Text(
                        'Place Order  •  \$${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF6750A4).withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.sp, color: const Color(0xFF6750A4)),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF6750A4),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          child,
        ],
      ),
    );
  }
}

class _StyledField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _StyledField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20.sp),
        filled: true,
        fillColor: const Color(0xFFF5F3FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              BorderSide(color: const Color(0xFF6750A4), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade400, width: 1.5),
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      ),
    );
  }
}
