import 'dart:convert';

import 'package:feature_mind_demo/models/articles_model.dart';
import 'package:feature_mind_demo/models/recent_searches_model.dart';
import 'package:feature_mind_demo/services/home_service.dart';
import 'package:feature_mind_demo/utils/app_logger.dart';
import 'package:feature_mind_demo/utils/app_snack_bars.dart';
import 'package:feature_mind_demo/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._ref);

  final ChangeNotifierProviderRef<HomeViewModel> _ref;

  final _homeService = HomeService();
  final _storage = AppStorage();
  final searchController = TextEditingController();
  var articles = <ArticlesModel>[];
  var page = 1;
  var articlesLoading = false;
  var recentSearches = <RecentSearchesModel>[];

  /// Searches for all related news using the [query]
  Future<void> searchNews(BuildContext context, {required String query, bool isRefresh = false}) async {
    if (page == 1) {
      articlesLoading = true;
      notifyListeners();
      articles.clear();
      if (!isRefresh) {
        fetchCachedResult(query: query.toLowerCase());
        cacheSearchTerm(query: query);
      }
    }
    final response = await _homeService.searchNews(query: query, page: page);
    if (response.status == "ok") {
      final currentArticles = response.data ?? [];
      // Remove "[Removed]" articles from the list
      currentArticles.removeWhere((article) => article.title.toLowerCase().contains("[removed]"));
      if (page > 1) {
        articles.addAll(currentArticles);
      } else {
        if (articles.isNotEmpty && context.mounted) {
          AppSnackBars.refresh(context, articles: currentArticles);
        } else {
          articles = currentArticles;
          cacheSearchResult(query: query.toLowerCase(), articles: articles);
        }
      }
      final noOfPages = (response.totalResults / 20).ceil();
      if (noOfPages == page) page = 0;
    } else {
      if (context.mounted) AppSnackBars.error(context, message: "Something went wrong. Please try again.");
    }
    articlesLoading = false;
    notifyListeners();
  }

  /// Caches the [articles] from a search result with a [query] to local storage
  Future<void> cacheSearchResult({required String query, required List<ArticlesModel> articles}) async {
    try {
      final List<Map<String, dynamic>> articlesMap = articles.map((article) => article.toJson()).toList();
      final value = jsonEncode(articlesMap);
      await _storage.write(query, value);
    } catch (e, s) {
      AppLogger.log("Caching Result", e: e, s: s);
    }
  }

  /// Fetches the cached articles of a search result with a [query] from local storage (if available)
  Future<void> fetchCachedResult({required String query}) async {
    try {
      final articlesJson = await _storage.read<String>(query);
      if (articlesJson == null) return;
      final List<dynamic> data = jsonDecode(articlesJson);
      articles = data.map((json) => ArticlesModel.fromJson(json)).toList();
      articlesLoading = false;
      notifyListeners();
    } catch (e, s) {
      AppLogger.log("Fetching Cached Result", e: e, s: s);
    }
  }

  /// Loads new [articles] over the old cached articles
  Future<void> loadNewResult({required List<ArticlesModel> articles}) async {
    articlesLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    this.articles = articles;
    articlesLoading = false;
    notifyListeners();
  }

  /// Caches the [query] of a search result to local storage
  Future<void> cacheSearchTerm({required String query}) async {
    try {
      recentSearches.add(RecentSearchesModel(query: query, createdAt: DateTime.now()));
      notifyListeners();
      final List<Map<String, dynamic>> searchesMap = recentSearches.map((search) => search.toJson()).toList();
      final value = jsonEncode(searchesMap);
      await _storage.write("recent_searches", value);
    } catch (e, s) {
      AppLogger.log("Caching Term", e: e, s: s);
    }
  }

  /// Fetches the cached queries from local storage (if available) and limits it to the recent 20 queries
  Future<void> fetchCachedTerm() async {
    try {
      final searchesJson = await _storage.read<String>("recent_searches");
      if (searchesJson == null) return;
      final List<dynamic> data = jsonDecode(searchesJson);
      final searches = data.map((json) => RecentSearchesModel.fromJson(json)).toList();
      if (searches.length > 20) {
        recentSearches = searches.sublist(searches.length - 20);
      } else {
        recentSearches = searches;
      }
      notifyListeners();
    } catch (e, s) {
      AppLogger.log("Fetching Cached Term", e: e, s: s);
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
