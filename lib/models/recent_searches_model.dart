import 'package:feature_mind_demo/utils/app_parsers.dart';

class RecentSearchesModel {
  RecentSearchesModel({
    String? query,
    DateTime? createdAt,
  }) {
    _query = query;
    _createdAt = createdAt;
  }

  RecentSearchesModel.fromJson(dynamic json) {
    _query = AppParsers.stringParse(json['query']);
    _createdAt = DateTime.tryParse(AppParsers.stringParse(json['createdAt']));
  }
  String? _query;
  DateTime? _createdAt;

  String get query => _query ?? "";
  DateTime get createdAt => _createdAt ?? DateTime(1970);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['query'] = _query;
    map['createdAt'] = "${_createdAt?.toIso8601String()}Z";
    return map;
  }
}
