import 'package:flutter/material.dart';
import 'package:tyba_universities/features/home/config/routes/home_routes.dart';
import 'package:tyba_universities/features/university_detail/config/routes/detail_routes.dart';

class AppRouter {
  AppRouter._();

  static const String initialRoute = HomeRoutes.homeRoute;

  static Map<String, WidgetBuilder> routes = {
    ...HomeRoutes.routes,
    ...UniversityDetailRoutes.routes,
  };
}
