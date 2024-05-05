import 'package:flutter/material.dart';
import 'package:bKash_flutter/utils/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,

    // define all used themes in the full project also the text styles
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,

    // define all used themes in the full project also the text styles
  );
}