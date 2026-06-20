import 'package:flutter/material.dart';
import 'package:tyba_universities/features/home/ui/page/home_page.dart';

final class HomeRoutes {
  static const String homeRoute = '/';

  static final Map<String, WidgetBuilder> routes = {homeRoute: getHomePage};

  static Widget getHomePage(BuildContext context) {
    return HomePage();
  }
}
