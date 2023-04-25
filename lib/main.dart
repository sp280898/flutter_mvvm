import 'package:flutter/material.dart';
import 'package:flutter_mvvm/getx_localisation/languages.dart';
import 'package:flutter_mvvm/resources/components/internet_exceptions.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/view/splasha_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      // locale: const Locale('hi', 'IN'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
