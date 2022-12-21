import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/views/auth/log_in.dart';
import 'package:beauty_queens_ustomer/views/auth/sign_up.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

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

    return Scaffold(
        appBar: noAppBar(),
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
                                text: "Sign In",
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
                                text: "Sign Up",
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
                                text: "Login As Guest",
                              ),
                            ),
                            const SizedBox(
                              height: 30,
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
