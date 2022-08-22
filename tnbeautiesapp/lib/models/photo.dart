class Photo {
  int id;
  String url;
  CopyrightType copyright;

  Photo({required this.id, required this.url, required this.copyright});
}

enum CopyrightType { publicDomain, creativeCommons, fairUse }
