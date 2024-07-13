import 'package:feature_mind_demo/utils/app_router.dart';
import 'package:feature_mind_demo/utils/app_snack_bars.dart';
import 'package:feature_mind_demo/utils/app_themes.dart';
import 'package:feature_mind_demo/view_models/theme_view_model.dart';
import 'package:feature_mind_demo/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init("Feature Mind");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          title: "Feature Mind Demo",
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(themeProvider).themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          initialRoute: HomeView.path,
          onGenerateRoute: AppRouter.onGenerateRoute,
          scaffoldMessengerKey: AppSnackBars.scaffoldMessengerKey,
        );
      },
    );
  }
}
