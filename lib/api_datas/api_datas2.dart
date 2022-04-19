/// title : "Dawn of the Planet of the Apes"
/// image : "https://api.androidhive.info/json/movies/1.jpg"
/// rating : 8.3
/// releaseYear : 2014
/// genre : ["Action","Drama","Sci-Fi"]

class ApiDatasNew {
  ApiDatasNew({
    String? title,
    String? image,
    String? rating,
    int? releaseYear,
    List<String>? genre,
  }) {
    _title = title;
    _image = image;
    _rating = rating;
    _releaseYear = releaseYear;
    _genre = genre;
  }

  ApiDatasNew.fromJson(dynamic json) {
    _title = json['title'];
    _image = json['image'];
    _rating = json['rating'];
    _releaseYear = json['releaseYear'];
    _genre = json['genre'] != null ? json['genre'].cast<String>() : [];
  }
  String? _title;
  String? _image;
  String? _rating;
  int? _releaseYear;
  List<String>? _genre;
  ApiDatasNew copyWith({
    String? title,
    String? image,
    String? rating,
    int? releaseYear,
    List<String>? genre,
  }) =>
      ApiDatasNew(
        title: title ?? _title,
        image: image ?? _image,
        rating: rating ?? _rating,
        releaseYear: releaseYear ?? _releaseYear,
        genre: genre ?? _genre,
      );
  String? get title => _title;
  String? get image => _image;
  String? get rating => _rating;
  int? get releaseYear => _releaseYear;
  List<String>? get genre => _genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['image'] = _image;
    map['rating'] = _rating;
    map['releaseYear'] = _releaseYear;
    map['genre'] = _genre;
    return map;
  }
}
