import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const kPrimary = Color(0xFF27AE60);
  static const kWarning = Color(0xFFFFBF00);
  static const error = Color(0xFFBA1A1A);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF410002);
  static const onSecondary = Color(0xFFFFFFFF);

  static const primaryContainerLight = Color(0xFFE3FCE6);
  static const onPrimaryContainerLight = Color(0xFF02511C);
  static const tertiaryLight = Color(0xFFFFFFFF);
  static const onTertiaryLight = Color(0xFFBDBDBD);
  static const surfaceLight = Color(0xFFF7FFF6);
  static const onSurfaceLight = Color(0xFF191C19);
  static const secondaryLight = Color(0xFF27AE60);

  static const primaryContainerDark = Color(0xFF04371B);
  static const onPrimaryContainerDark = Color(0xFF7CFC9E);
  static const backgroundDark = Color(0xFF151715);
  static const onBackgroundDark = Color(0xFF8E8E8E);
  static const surfaceDark = Color(0xFF1E211E);
  static const onSurfaceDark = Color(0xFFE2E3DE);
  static const secondaryDark = Color(0xFFE2E3DE);

  static final lightNavAndStatusBar = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.kPrimary.withOpacity(0.01),
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  static final darkNavAndStatusBar = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.kPrimary.withOpacity(0.01),
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarDividerColor: Colors.transparent,
  );
}
