import 'package:feature_mind_demo/models/articles_model.dart';
import 'package:feature_mind_demo/utils/app_colors.dart';
import 'package:feature_mind_demo/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBars {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Show a success snack bar with a custom [message]
  static void success(BuildContext context, {required String message, Duration? duration}) {
    if (!context.mounted) return;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        margin: EdgeInsets.all(15.w),
        padding: EdgeInsets.all(10.w),
        dismissDirection: DismissDirection.down,
        elevation: 0,
        duration: duration ?? const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        showCloseIcon: false,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(
              Icons.done_all_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 30.sp,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ),
          ],
        ),
      ),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        reverseCurve: Curves.easeOut,
        reverseDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  /// Show an error snack bar with a custom [message]
  static void error(BuildContext context, {required String message, Duration? duration}) {
    if (!context.mounted) return;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.all(15.w),
        padding: EdgeInsets.all(10.w),
        dismissDirection: DismissDirection.down,
        elevation: 0,
        duration: duration ?? const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        showCloseIcon: false,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 30.sp,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ),
          ],
        ),
      ),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        reverseCurve: Curves.easeOut,
        reverseDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  /// Show a warning snack bar with a custom [message]
  static void warning(BuildContext context, {required String message, Duration? duration}) {
    if (!context.mounted) return;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: AppColors.kWarning,
        margin: EdgeInsets.all(15.w),
        padding: EdgeInsets.all(10.w),
        dismissDirection: DismissDirection.down,
        elevation: 0,
        duration: duration ?? const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        showCloseIcon: false,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 30.sp,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ),
          ],
        ),
      ),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        reverseCurve: Curves.easeOut,
        reverseDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  /// Show a refresh snack bar that allows user load new [articles] that were fetched
  static void refresh(BuildContext context, {required List<ArticlesModel> articles}) {
    if (!context.mounted) return;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        width: 200.w,
        padding: EdgeInsets.all(10.w),
        dismissDirection: DismissDirection.down,
        elevation: 0,
        duration: const Duration(minutes: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        showCloseIcon: false,
        behavior: SnackBarBehavior.floating,
        content: Consumer(
          builder: (context, ref, _) {
            return GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                ref.watch(homeProvider).loadNewResult(articles: articles);
                scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 30.sp,
                  ),
                  5.horizontalSpace,
                  Text(
                    "Tap to refresh",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        reverseCurve: Curves.easeOut,
        reverseDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
