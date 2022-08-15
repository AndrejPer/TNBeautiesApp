class Photo {
  int _id;
  String _url;
  CopyrightType _copyright;

  Photo(this._id, this._url, this._copyright);
}

enum CopyrightType { publicDomain, creativeCommons, fairUse }
