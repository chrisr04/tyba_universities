import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';

class UniversityModel extends UniversityEntity {
  UniversityModel({
    required super.alphaTwoCode,
    required super.domains,
    required super.country,
    required super.stateProvince,
    required super.webPages,
    required super.name,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        alphaTwoCode: json['alpha_two_code'] ?? '',
        domains: List<String>.from(json['domains'] ?? []),
        country: json['country'] ?? '',
        stateProvince: json['state-province'],
        webPages: List<String>.from(json['web_pages'] ?? []),
        name: json['name'] ?? '',
      );
}
