import 'package:feature_mind_demo/models/app_response_model.dart';
import 'package:feature_mind_demo/models/articles_model.dart';
import 'package:feature_mind_demo/services/base_service.dart';
import 'package:feature_mind_demo/utils/app_logger.dart';

class HomeService {
  final _api = BaseService();

  /// Fetches articles using a given [query] and [page]
  Future<AppResponse<List<ArticlesModel>>> searchNews({required String query, required int page}) async {
    final response = await _api.get(
      "/v2/everything?q=$query&pageSize=20&page=$page",
      name: "Search News",
      logResponse: false,
    );

    final articles = <ArticlesModel>[];
    if (response.status == "ok" && response.data != null) {
      try {
        for (final data in response.data) {
          articles.add(ArticlesModel.fromJson(data));
        }
      } catch (e, s) {
        AppLogger.log(e.runtimeType, e: "Search News - ${e.toString()}", s: s);
        return AppResponse(
          status: "error",
          totalResults: 0,
        );
      }
    }

    return AppResponse<List<ArticlesModel>>(
      status: response.status,
      totalResults: response.totalResults,
      data: articles,
    );
  }
}
