import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:ochildasturxon/src/core/style/text_style.dart";
import "color_schema.dart";

@immutable
final class AppThemes {
  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  AppThemes({required this.mode})
      : darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: darkColorScheme.surface,
          textTheme: const AppTextStyle(),
          appBarTheme: AppBarTheme(
            backgroundColor: darkColorScheme.surface,
          ),
        ),
        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.surface,
          textTheme: const AppTextStyle(),
          appBarTheme: AppBarTheme(
            backgroundColor: lightColorScheme.surface,
          ),
        );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.surface,
          surfaceTintColor: lightColorScheme.surface,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightColorScheme.surface,
        ),
        shadowColor: lightColorScheme.shadow,
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColorScheme.surface,
          surfaceTintColor: darkColorScheme.surface,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorScheme.surface,
        ),
        shadowColor: darkColorScheme.shadow,
      );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
}
