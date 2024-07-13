import 'package:feature_mind_demo/utils/app_extensions.dart';
import 'package:feature_mind_demo/view_models/home_view_model.dart';
import 'package:feature_mind_demo/views/home/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppBottomSheets {
  static show(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.25),
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        return Container(
          height: 500.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          child: child,
        );
      },
    );
  }

  /// Show Recent Searches bottom sheet
  static recentSearches(BuildContext context) {
    show(
      context,
      child: Consumer(
        builder: (context, ref, _) {
          final recentSearches = ref.watch(homeProvider).recentSearches.reversed.toList();
          return Column(
            children: [
              10.verticalSpace,
              Container(
                height: 5.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onTertiary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              10.verticalSpace,
              Text(
                "Recent Searches",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              10.verticalSpace,
              Expanded(
                child: SafeArea(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      final recentSearch = recentSearches[index];
                      return TextButton(
                        onPressed: () {
                          context.pop();
                          context.off(SearchResultsView.path, arguments: recentSearch.query);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recentSearch.query,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                  ),
                                  Text(
                                    DateFormat("EEE, dd MMM yyy | hh:mm a").format(recentSearch.createdAt),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: Theme.of(context).colorScheme.onTertiary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.onTertiary,
                              size: 15.sp,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          5.verticalSpace,
                          const Divider(),
                          5.verticalSpace,
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
