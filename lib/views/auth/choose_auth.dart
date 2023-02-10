import 'dart:io';

import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/components/common/text_alert.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/views/auth/log_in.dart';
import 'package:beauty_queens_ustomer/views/auth/sign_up.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChooseAuth extends StatefulWidget {
  const ChooseAuth({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChooseAuth> createState() => _ChooseAuth();
}

class _ChooseAuth extends State<ChooseAuth> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Get.put(AuthController());
    Get.put(CartController());

    return Scaffold(
        appBar: noAppBar(showCart: false),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                secandaryColor,
                primaryColor,
                secandaryColor,
              ],
            )),
            height: height,
            width: width,
            child: Stack(
              children: [
                LogoImage(height: height),

                // const Text("Dalilee Shiper "),
                Positioned(
                    bottom: 0,
                    left: 00,
                    right: 0,
                    child: Animate(
                      effects: const [
                        // FadeEffect(delay: Duration(milliseconds: 800)),
                        // MoveEffect()
                        MoveEffect(
                            begin: Offset(0, 800),
                            curve: Curves.easeInOut,
                            delay: Duration(milliseconds: 000),
                            duration: Duration(milliseconds: 600)),
                      ],
                      child: Container(
                        height: height * 0.65,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.8,
                              height: height * 0.06,
                              child: iconButton(
                                onClick: () {
                                  Get.to(const Login(title: ""));
                                },
                                text: "SignIn".tr,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              height: height * 0.06,
                              child: iconButton(
                                onClick: () {
                                  Get.to(const SignUp(title: ""));
                                },
                                text: "SignUp".tr,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              height: height * 0.06,
                              child: iconButton(
                                onClick: () {
                                  Get.to(const DashboardView(title: ""));
                                },
                                text: "LoginAsGuest".tr,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                textDirection: TextDirection.ltr,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      if (Get.locale.toString() == "ar")
                                        textAlert(context,
                                            title: "language_alert".tr,
                                            buttons: DialogButton(
                                                onPressed: (() {
                                                  MyApp().storage.write(
                                                      localizationPath,
                                                      Get.locale.toString() ==
                                                              "en"
                                                          ? "ar"
                                                          : "en");
                                                  if (Platform.isAndroid) {
                                                    Restart.restartApp();
                                                  } else {
                                                    Phoenix.rebirth(context);

                                                    Navigator.pop(context);
                                                  }
                                                }),
                                                child: Text(
                                                  "Yes".tr,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ))).show()
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Get.locale.toString() == "ar"
                                              ? secandaryColor
                                              : primaryColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          )),
                                      child: Center(
                                        child: Text(
                                          "English",
                                          style: TextStyle(
                                            fontFamily: "primary",
                                            color: Get.locale.toString() == "en"
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      if (Get.locale.toString() == "en")
                                        textAlert(context,
                                            title: "language_alert".tr,
                                            buttons: DialogButton(
                                                onPressed: (() {
                                                  MyApp().storage.write(
                                                      localizationPath,
                                                      Get.locale.toString() ==
                                                              "en"
                                                          ? "ar"
                                                          : "en");
                                                  if (Platform.isAndroid) {
                                                    Restart.restartApp();
                                                  } else {
                                                    Phoenix.rebirth(context);

                                                    Navigator.pop(context);
                                                  }
                                                }),
                                                child: Text(
                                                  "Yes".tr,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ))).show()
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Get.locale.toString() == "en"
                                              ? secandaryColor
                                              : primaryColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          )),
                                      child: Center(
                                        child: Text(
                                          "عربي",
                                          style: TextStyle(
                                            fontFamily: "primary",
                                            color: Get.locale.toString() == "ar"
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
