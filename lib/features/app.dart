import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meadowkart_task/core/router/router_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return SafeArea(
            top: false,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: RouteManager.router,
              theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: const Color(0xFF6750A4),
                brightness: Brightness.light,
                scaffoldBackgroundColor: const Color(0xFFF5F3FF),
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color(0xFF6750A4),
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
