import 'package:appd/core/thmes.dart';
import 'package:appd/home/home_screen.dart';
import 'package:appd/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/languegs.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NotPad',
      translations: Messages(), // your translations
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('fa', 'IR'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home:
          GetStorage().read("isLogin") == "true" ? HomeScreen() : LoginScreen(),
    );
  }
}
