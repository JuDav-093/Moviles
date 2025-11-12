
import 'package:flutter/material.dart';
import 'schema_color.dart';
import 'theme_appbar.dart';
import 'theme_button.dart';
import 'theme_formulary.dart';
import 'typography.dart';

ThemeData get appTheme {
  return ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    appBarTheme: appbarTheme,
    textTheme: appTypography,
    inputDecorationTheme: formularyTheme,
    elevatedButtonTheme: buttonTheme,
  );
}