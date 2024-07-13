import 'dart:io';

import 'package:feature_mind_demo/utils/app_bottom_sheets.dart';
import 'package:feature_mind_demo/utils/app_extensions.dart';
import 'package:feature_mind_demo/utils/app_snack_bars.dart';
import 'package:feature_mind_demo/view_models/home_view_model.dart';
import 'package:feature_mind_demo/views/home/widgets/articles_list.dart';
import 'package:feature_mind_demo/views/home/widgets/articles_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchResultsView extends ConsumerStatefulWidget {
  const SearchResultsView({super.key, required this.query});

  final String query;

  static const path = "/search";

  @override
  SearchResultsViewState createState() => SearchResultsViewState();
}

class SearchResultsViewState extends ConsumerState<SearchResultsView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.query.trim().isEmpty) {
        context.pop();
        AppSnackBars.error(context, message: "Please enter a valid search term");
      } else {
        ref.watch(homeProvider)
          ..page = 1
          ..searchNews(context, query: widget.query);
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AppSnackBars.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppBottomSheets.recentSearches(context);
            },
            icon: Icon(
              Icons.history_rounded,
              size: 30.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          10.horizontalSpace,
        ],
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          if (ref.watch(homeProvider).articlesLoading) {
            return AnimationLimiter(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20.w),
                itemCount: 5,
                itemBuilder: (_, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      verticalOffset: 50.h,
                      child: FadeInAnimation(
                        child: ArticlesShimmer(index: index),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      verticalOffset: 50.h,
                      child: FadeInAnimation(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            10.verticalSpace,
                            const Divider(),
                            10.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (ref.watch(homeProvider).articles.isEmpty) {
            return Center(
              child: Text(
                "No results found",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            );
          } else {
            final articles = ref.watch(homeProvider).articles;
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                ref.watch(homeProvider).page = 1;
                await ref.watch(homeProvider).searchNews(context, query: widget.query, isRefresh: true);
                return;
              },
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.primary,
              child: AnimationLimiter(
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEndNotification) {
                    final page = ref.watch(homeProvider).page;
                    final metrics = scrollEndNotification.metrics;
                    if (metrics.atEdge && metrics.pixels != 0 && page != 0) {
                      ref.read(homeProvider).page++;
                      ref.watch(homeProvider).searchNews(context, query: widget.query);
                    }
                    return true;
                  },
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(20.w),
                    itemCount: ref.watch(homeProvider).page != 0 ? articles.length + 1 : articles.length,
                    itemBuilder: (context, index) {
                      Widget child;
                      if (ref.watch(homeProvider).page != 0 && articles.length == index) {
                        child = Container(
                          height: 25.h,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          alignment: Alignment.center,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Platform.isIOS ? Theme.of(context).colorScheme.primary : null,
                              strokeWidth: 3.w,
                            ),
                          ),
                        );
                      } else {
                        child = ArticlesList(article: articles[index]);
                      }
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 1),
                        child: SlideAnimation(
                          verticalOffset: 50.h,
                          child: FadeInAnimation(
                            child: child,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 1),
                        child: SlideAnimation(
                          verticalOffset: 50.h,
                          child: FadeInAnimation(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                10.verticalSpace,
                                const Divider(),
                                10.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
