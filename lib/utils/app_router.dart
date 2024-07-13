import 'package:feature_mind_demo/views/home/home.dart';
import 'package:feature_mind_demo/views/home/search_results.dart';
import 'package:feature_mind_demo/views/route/not_found.dart';
import 'package:flutter/material.dart';

class AppRouter {
  /// The route generator callback used when the app is navigated to a named route
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.path:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case SearchResultsView.path:
        final argument = settings.arguments as String?;
        return MaterialPageRoute(builder: (context) => SearchResultsView(query: argument ?? ""));
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundView());
    }
  }
}
