class SectionModel {
  SectionModel({
    required this.section,
    required this.about,
    required this.route,
     this.useWeb = false,
  });
  final String section, about, route;
  final bool useWeb;
}
