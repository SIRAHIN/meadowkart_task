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
            ),
          );
        },
      ),
    );
  }
}
