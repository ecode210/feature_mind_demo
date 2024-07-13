import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesShimmer extends StatelessWidget {
  const ArticlesShimmer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeShimmer(
          height: 200.h,
          width: double.infinity,
          baseColor: Theme.of(context).colorScheme.onTertiary,
          highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
          radius: 15.r,
          millisecondsDelay: index * 100,
        ),
        10.verticalSpace,
        FadeShimmer(
          height: 20.h,
          width: double.infinity,
          baseColor: Theme.of(context).colorScheme.onTertiary,
          highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
          radius: 5.r,
          millisecondsDelay: index * 100,
        ),
        5.verticalSpace,
        FadeShimmer(
          height: 20.h,
          width: 250.w,
          baseColor: Theme.of(context).colorScheme.onTertiary,
          highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
          radius: 5.r,
          millisecondsDelay: index * 100,
        ),
        10.verticalSpace,
        Row(
          children: [
            FadeShimmer(
              height: 15.h,
              width: 150.w,
              baseColor: Theme.of(context).colorScheme.onTertiary,
              highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
              radius: 5.r,
              millisecondsDelay: index * 100,
            ),
            5.horizontalSpace,
            FadeShimmer.round(
              size: 5.sp,
              baseColor: Theme.of(context).colorScheme.onTertiary,
              highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
              millisecondsDelay: index * 100,
            ),
            5.horizontalSpace,
            FadeShimmer(
              height: 15.h,
              width: 100.w,
              baseColor: Theme.of(context).colorScheme.onTertiary,
              highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
              radius: 5.r,
              millisecondsDelay: index * 100,
            ),
          ],
        ),
      ],
    );
  }
}
