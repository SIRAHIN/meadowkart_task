import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meadowkart_task/core/router/router_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Navigate after 2 seconds
    Timer(const Duration(seconds: 2), () {
      RouteManager.router.goNamed(productsViewName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6750A4),
              Color(0xFF7E57C2),
              Color(0xFFB39DDB),
              Color(0xFFF5F3FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'MeadowKart',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
