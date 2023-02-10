import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/conrtollers/languageController.dart';
import 'package:beauty_queens_ustomer/views/auth/choose_auth.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final storage = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final token = storage.read(tokenPath) ?? "";
    final local = storage.read(localizationPath) ?? "en";

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      translations: Messages(), // your translations
      locale: Locale(local), // translations will be displayed in that locale
      fallbackLocale: Locale(local),
      title: 'Queens Beauty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token == "" || token == null
          ? const ChooseAuth(
              title: "",
            )
          : const DashboardView(title: ""),
    );
  }
}
