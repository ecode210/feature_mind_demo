import 'package:feature_mind_demo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    dividerColor: AppColors.onTertiaryLight.withOpacity(0.25),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kPrimary,
      primary: AppColors.kPrimary,
      primaryContainer: AppColors.primaryContainerLight,
      onPrimaryContainer: AppColors.onPrimaryContainerLight,
      tertiary: AppColors.tertiaryLight,
      onTertiary: AppColors.onTertiaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      error: AppColors.error,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondary,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      displayMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      displaySmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineSmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      bodyLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodySmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      titleMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleSmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceLight,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.tertiaryLight,
      foregroundColor: AppColors.onSurfaceLight,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: AppColors.lightNavAndStatusBar,
      // scrolledUnderElevation: 0,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.onTertiaryLight,
      thickness: 1.h,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    ),
    scaffoldBackgroundColor: AppColors.tertiaryLight,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    dividerColor: AppColors.onBackgroundDark.withOpacity(0.25),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kPrimary,
      primary: AppColors.kPrimary,
      primaryContainer: AppColors.primaryContainerDark,
      onPrimaryContainer: AppColors.onPrimaryContainerDark,
      tertiary: AppColors.backgroundDark,
      onTertiary: AppColors.onBackgroundDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: AppColors.error,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondary,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      displayMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      displaySmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineSmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      bodyLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodySmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleLarge: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      titleMedium: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleSmall: GoogleFonts.workSans(
        textStyle: TextStyle(
          color: AppColors.onSurfaceDark,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.onSurfaceDark,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: AppColors.darkNavAndStatusBar,
      // scrolledUnderElevation: 0,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.onBackgroundDark,
      thickness: 1.h,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
  );
}
