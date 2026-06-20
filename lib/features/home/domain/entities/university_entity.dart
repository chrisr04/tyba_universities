class UniversityEntity {
  const UniversityEntity({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
  });

  final String alphaTwoCode;
  final List<String> domains;
  final String country;
  final String? stateProvince;
  final List<String> webPages;
  final String name;
}
