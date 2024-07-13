import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:feature_mind_demo/models/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.article});

  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage,
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            placeholder: (context, url) {
              return FadeShimmer(
                height: 200.h,
                width: double.infinity,
                baseColor: Theme.of(context).colorScheme.onTertiary,
                highlightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(0.25),
                radius: 15.r,
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              );
            },
          ),
        ),
        10.verticalSpace,
        Text(
          article.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        5.verticalSpace,
        Row(
          children: [
            Flexible(
              child: Text(
                article.source.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
              ),
            ),
            5.horizontalSpace,
            CircleAvatar(
              radius: 2.sp,
              backgroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            5.horizontalSpace,
            Text(
              DateFormat("EEE, dd MMM yyyy").format(article.publishedAt),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
