import 'dart:html';

class Photo {
  int _id;
  File _object;
  String _url;
  CopyrightType _copyright;

  Photo(this._id, this._object, this._url, this._copyright);
}

enum CopyrightType { publicDomain, creativeCommons, fairUse }
