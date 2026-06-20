import 'package:flutter/material.dart';
import 'package:tyba_universities/features/university_detail/ui/page/university_detail_page.dart';

final class UniversityDetailRoutes {
  static const String universityDetailRoute = '/university-detail';

  static final Map<String, WidgetBuilder> routes = {
    universityDetailRoute: getUniversityDetailPage,
  };

  static Widget getUniversityDetailPage(BuildContext context) {
    return UniversityDetailPage();
  }
}
