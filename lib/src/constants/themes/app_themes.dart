import 'package:fl_auth/src/constants/themes/themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.whiteClear,
      primaryColor: AppColor.getMaterialColorFromColor(AppColor.white),
      textTheme: TextThemes.textTheme
          .apply(bodyColor: AppColor.black, displayColor: AppColor.black),
      primaryTextTheme: TextThemes.primaryTextTheme,
      iconTheme: const IconThemeData(
        color: AppColor.black,
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColor.white,
        onPrimary: Colors.grey[300],
        secondary: AppColor.blueWhite,
        onSecondary: AppColor.blue,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.white,
        titleTextStyle: AppTypography.titleMd,
        toolbarTextStyle: TextThemes.textTheme.headlineSmall?.copyWith(
          color: AppColor.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.lightGrey,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class TextThemes {
  /// [INFO]
  /// Main Text Theme with Material Style
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: AppTypography.displayLg,
      displayMedium: AppTypography.displayMd,
      displaySmall: AppTypography.displaySm,
      headlineLarge: AppTypography.headlineLg,
      headlineMedium: AppTypography.headlineMd,
      headlineSmall: AppTypography.headlineSm,
      titleLarge: AppTypography.titleLg,
      titleMedium: AppTypography.titleMd,
      titleSmall: AppTypography.titleSm,
      labelLarge: AppTypography.labelLg,
      labelMedium: AppTypography.labelMd,
      labelSmall: AppTypography.labelSm,
      bodyLarge: AppTypography.bodyLg,
      bodyMedium: AppTypography.bodyMd,
      bodySmall: AppTypography.bodySm,
    );
  }

  /// [INFO]
  /// Dark Text Theme with Material Style
  static TextTheme get darkTextTheme {
    return TextTheme(
      displayLarge: AppTypography.displayLg.copyWith(color: AppColor.white),
      displayMedium: AppTypography.displayMd.copyWith(color: AppColor.white),
      displaySmall: AppTypography.displaySm.copyWith(color: AppColor.white),
      headlineLarge: AppTypography.headlineLg.copyWith(color: AppColor.white),
      headlineMedium: AppTypography.headlineMd.copyWith(color: AppColor.white),
      headlineSmall: AppTypography.headlineSm.copyWith(color: AppColor.white),
      titleLarge: AppTypography.titleLg.copyWith(color: AppColor.white),
      titleMedium: AppTypography.titleMd.copyWith(color: AppColor.white),
      titleSmall: AppTypography.titleSm.copyWith(color: AppColor.white),
      labelLarge: AppTypography.labelLg.copyWith(color: AppColor.white),
      labelMedium: AppTypography.labelMd.copyWith(color: AppColor.white),
      labelSmall: AppTypography.labelSm.copyWith(color: AppColor.white),
      bodyLarge: AppTypography.bodyLg.copyWith(color: AppColor.white),
      bodyMedium: AppTypography.bodyMd.copyWith(color: AppColor.white),
      bodySmall: AppTypography.bodySm.copyWith(color: AppColor.white),
    );
  }

  /// [INFO]
  /// Text theme with [AppColor.blue]
  static TextTheme get primaryTextTheme {
    return TextTheme(
      displayLarge: AppTypography.displayLg.copyWith(color: AppColor.blue),
      displayMedium: AppTypography.displayMd.copyWith(color: AppColor.blue),
      displaySmall: AppTypography.displaySm.copyWith(color: AppColor.blue),
      headlineLarge: AppTypography.headlineLg.copyWith(color: AppColor.blue),
      headlineMedium: AppTypography.headlineMd.copyWith(color: AppColor.blue),
      headlineSmall: AppTypography.headlineSm.copyWith(color: AppColor.blue),
      titleLarge: AppTypography.titleLg.copyWith(color: AppColor.blue),
      titleMedium: AppTypography.titleMd.copyWith(color: AppColor.blue),
      titleSmall: AppTypography.titleSm.copyWith(color: AppColor.blue),
      labelLarge: AppTypography.labelLg.copyWith(color: AppColor.blue),
      labelMedium: AppTypography.labelMd.copyWith(color: AppColor.blue),
      labelSmall: AppTypography.labelSm.copyWith(color: AppColor.blue),
      bodyLarge: AppTypography.bodyLg.copyWith(color: AppColor.blue),
      bodyMedium: AppTypography.bodyMd.copyWith(color: AppColor.blue),
      bodySmall: AppTypography.bodySm.copyWith(color: AppColor.blue),
    );
  }
}
