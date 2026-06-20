import 'package:flutter/material.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/university_detail/ui/page/university_detail_page.dart';

final class UniversityDetailRoutes {
  static const String universityDetailRoute = '/university-detail';

  static final Map<String, WidgetBuilder> routes = {
    universityDetailRoute: getUniversityDetailPage,
  };

  static Widget getUniversityDetailPage(BuildContext context) {
    final university =
        ModalRoute.settingsOf(context)?.arguments as UniversityEntity?;

    if (university == null) {
      throw ArgumentError.notNull('university');
    }

    return UniversityDetailPage(university: university);
  }
}
