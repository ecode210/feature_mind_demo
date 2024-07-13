import 'package:feature_mind_demo/utils/app_parsers.dart';

class ArticlesModel {
  ArticlesModel({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  ArticlesModel.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(AppParsers.mapParse(json['source'])) : null;
    _author = AppParsers.stringParse(json['author']);
    _title = AppParsers.stringParse(json['title']);
    _description = AppParsers.stringParse(json['description']);
    _url = AppParsers.stringParse(json['url']);
    _urlToImage = AppParsers.stringParse(json['urlToImage']);
    _publishedAt = DateTime.tryParse(AppParsers.stringParse(json['publishedAt']));
    _content = AppParsers.stringParse(json['content']);
  }

  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  DateTime? _publishedAt;
  String? _content;

  ArticlesModel copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) =>
      ArticlesModel(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );

  Source get source => _source ?? Source();

  String get author => _author ?? "";

  String get title => _title ?? "";

  String get description => _description ?? "";

  String get url => _url ?? "";

  String get urlToImage => _urlToImage ?? "";

  DateTime get publishedAt => _publishedAt ?? DateTime(1970);

  String get content => _content ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = "${_publishedAt?.toIso8601String()}Z";
    map['content'] = _content;
    return map;
  }
}

class Source {
  Source({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = AppParsers.stringParse(json['id']);
    _name = AppParsers.stringParse(json['name']);
  }

  String? _id;
  String? _name;

  Source copyWith({
    String? id,
    String? name,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
      );

  String get id => _id ?? "";

  String get name => _name ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
