import 'package:feature_mind_demo/utils/app_parsers.dart';

class AppResponse<T> {
  AppResponse({
    String? status,
    num? totalResults,
    T? data,
  }) {
    _status = status;
    _totalResults = totalResults;
    _data = data;
  }

  AppResponse.fromJson(dynamic json) {
    _status = AppParsers.stringParse(json['status']);
    _totalResults = AppParsers.numParse(json['totalResults']);
    _data = json['articles'];
  }
  String? _status;
  num? _totalResults;
  T? _data;

  AppResponse copyWith({
    String? status,
    num? totalResults,
    T? data,
  }) =>
      AppResponse(
        status: status ?? _status,
        totalResults: totalResults ?? _totalResults,
        data: data ?? _data,
      );

  String get status => _status ?? "";
  num get totalResults => _totalResults ?? 0;
  T? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    return map;
  }
}
