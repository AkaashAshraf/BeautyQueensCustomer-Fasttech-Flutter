import 'package:beauty_queens_ustomer/conrtollers/languageController.dart';
import 'package:beauty_queens_ustomer/views/auth/choose_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(), // your translations
      locale:
          const Locale('en'), // translations will be displayed in that locale
      fallbackLocale: const Locale('ar'),
      title: 'Queens Beauty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseAuth(
        title: "",
      ),
    );
  }
}
