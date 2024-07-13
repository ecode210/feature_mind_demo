import 'package:dio/dio.dart';
import 'package:feature_mind_demo/env/env.dart';
import 'package:feature_mind_demo/models/app_response_model.dart';
import 'package:feature_mind_demo/utils/app_constants.dart';
import 'package:feature_mind_demo/utils/app_logger.dart';
import 'package:feature_mind_demo/utils/app_parsers.dart';
import 'package:flutter/foundation.dart';

class BaseService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseURL,
      connectTimeout: const Duration(seconds: 100),
      receiveTimeout: const Duration(seconds: 100),
      sendTimeout: const Duration(seconds: 100),
      headers: {"Authorization": Env.apiKey},
    ),
  );

  /// HTTP GET request on [path] with a given [name] using Dio. Use [logResponse] to print the request's response to the console, defaults to false.
  Future<AppResponse> get(String path, {required String name, bool logResponse = false}) async {
    final shouldLog = kDebugMode && logResponse;
    try {
      final response = await _dio.get(path);
      final data = AppResponse.fromJson(response.data);
      if (shouldLog) AppLogger.log(response.data, e: name);

      return data;
    } catch (e, s) {
      var data = AppResponse(status: "error", totalResults: 0);

      if (e is DioException) {
        final value = AppParsers.mapParse(e.response?.data);
        data = AppResponse(
          status: value.containsKey("status") ? AppParsers.stringParse(value["status"]) : "error",
          totalResults: value.containsKey("totalResults") ? AppParsers.numParse(value["totalResults"]) : 0,
        );
        if (shouldLog) AppLogger.log(data.toJson(), e: name);
      } else if (e is TypeError) {
        data = AppResponse(status: "error", totalResults: 0);
        if (shouldLog) AppLogger.log(data.toJson(), e: "$name - ${e.toString()}", s: s);
      } else {
        if (shouldLog) AppLogger.log(e.runtimeType, e: "$name - ${e.toString()}", s: s);
      }

      return data;
    }
  }
}
