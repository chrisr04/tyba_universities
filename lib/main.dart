import 'package:flutter/material.dart';
import 'package:tyba_universities/core/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
