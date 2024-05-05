import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bKash_flutter/routes/route_destinations.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:bKash_flutter/utils/config.dart';
import 'package:bKash_flutter/utils/languages.dart';
import 'package:bKash_flutter/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,

      // Themes
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,

      // Localizations
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // Routes
      getPages: RouteDestinations.pages,
      initialRoute: RouteNames.welcome,
    );
  }
}
