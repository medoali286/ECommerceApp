class Product {
  String _pPrice;
  String _pName;
  String _pDescription;
  String _pCategory;
  String _imageLocation;

  Product(this._pPrice, this._pName, this._pDescription, this._pCategory,
      this._imageLocation);

  String get imageLocation => _imageLocation;

  set imageLocation(String value) {
    _imageLocation = value;
  }

  String get pCategory => _pCategory;

  set pCategory(String value) {
    _pCategory = value;
  }

  String get pDescription => _pDescription;

  set pDescription(String value) {
    _pDescription = value;
  }

  String get pName => _pName;

  set pName(String value) {
    _pName = value;
  }

  String get pPrice => _pPrice;

  set pPrice(String value) {
    _pPrice = value;
  }
}
