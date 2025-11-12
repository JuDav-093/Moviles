
import 'package:flutter/material.dart';
import 'schema_color.dart';

InputDecorationTheme formularyTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: primaryColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: secondaryColor, width: 2.0),
  ),
  labelStyle: const TextStyle(color: primaryColor),
);