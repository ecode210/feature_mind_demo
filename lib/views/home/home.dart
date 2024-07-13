import 'package:feature_mind_demo/utils/app_assets.dart';
import 'package:feature_mind_demo/utils/app_extensions.dart';
import 'package:feature_mind_demo/utils/app_snack_bars.dart';
import 'package:feature_mind_demo/view_models/home_view_model.dart';
import 'package:feature_mind_demo/view_models/theme_view_model.dart';
import 'package:feature_mind_demo/views/home/search_results.dart';
import 'package:feature_mind_demo/views/widgets/app_button.dart';
import 'package:feature_mind_demo/views/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const path = "/home";

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(homeProvider).fetchCachedTerm();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Infinite News",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.watch(themeProvider).toggleTheme(context);
              },
              icon: Icon(
                Icons.dark_mode_rounded,
                size: 30.sp,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            10.horizontalSpace,
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              20.verticalSpace,
              Container(
                height: 270.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      SVGAssets.logo,
                      height: 80.h,
                      fit: BoxFit.fitHeight,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Spacer(),
                    10.verticalSpace,
                    AppTextField(
                      controller: ref.watch(homeProvider).searchController,
                      label: "Search",
                      hint: "Search for any news",
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          context.push(
                            SearchResultsView.path,
                            arguments: ref.watch(homeProvider).searchController.text.trim(),
                          );
                          ref.watch(homeProvider).searchController.clear();
                        } else {
                          AppSnackBars.error(context, message: "Please enter a valid search term");
                        }
                      },
                    ),
                    10.verticalSpace,
                    AppButton(
                      onTap: () {
                        final value = ref.watch(homeProvider).searchController.text.trim();
                        if (value.isNotEmpty) {
                          context.push(SearchResultsView.path, arguments: value);
                          ref.watch(homeProvider).searchController.clear();
                        } else {
                          AppSnackBars.error(context, message: "Please enter a valid search term");
                        }
                      },
                      title: "Search",
                      icon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFEC1C2E),
                            const Color(0xFFEC1C2E).withOpacity(0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -30.w,
                      child: SvgPicture.asset(
                        SVGAssets.cnn,
                        height: 40.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFD4A10F),
                            const Color(0xFFD4A10F).withOpacity(0),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -20.w,
                      child: SvgPicture.asset(
                        SVGAssets.alJazeera,
                        height: 70.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.onSurface,
                            Theme.of(context).colorScheme.onSurface.withOpacity(0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -40.w,
                      child: SvgPicture.asset(
                        SVGAssets.bbc,
                        height: 30.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF4285F4),
                            const Color(0xFF4285F4).withOpacity(0),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -20.w,
                      child: SvgPicture.asset(
                        SVGAssets.google,
                        height: 50.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF0DB14B),
                            const Color(0xFF0DB14B).withOpacity(0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -40.w,
                      child: SvgPicture.asset(
                        SVGAssets.msnbc,
                        height: 50.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFE04403),
                            const Color(0xFFE04403).withOpacity(0),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -20.w,
                      child: SvgPicture.asset(
                        SVGAssets.gtCo,
                        height: 50.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
