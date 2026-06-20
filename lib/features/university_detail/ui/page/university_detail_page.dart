import 'package:flutter/material.dart';
import 'package:tyba_universities/common/widgets/info_row.dart';
import 'package:tyba_universities/common/widgets/multi_info_row.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/university_detail/config/values/university_detail_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityDetailPage extends StatelessWidget {
  const UniversityDetailPage({super.key, required this.university});

  final UniversityEntity university;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(UniversityDetailStrings.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          children: [
            InfoRow(
              label: UniversityDetailStrings.name,
              value: university.name,
            ),
            InfoRow(
              label: UniversityDetailStrings.code,
              value: university.alphaTwoCode,
            ),
            MultiInfoRow(
              label: UniversityDetailStrings.domains,
              values: university.domains,
            ),
            InfoRow(
              label: UniversityDetailStrings.country,
              value: university.country,
            ),
            InfoRow(
              label: UniversityDetailStrings.stateProvince,
              value: university.stateProvince ?? '',
            ),
            MultiInfoRow(
              label: UniversityDetailStrings.webPages,
              values: university.webPages,
              onTap: _onTapLink,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapLink(String page) async {
    final uri = Uri.parse(page);
    await launchUrl(uri);
  }
}
