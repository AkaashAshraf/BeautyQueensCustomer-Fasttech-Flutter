import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/labels/auth_top_label.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/password_input.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PasswordScreen> createState() => _PasswordScreen();
}

class _PasswordScreen extends State<PasswordScreen> {
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
                            begin: Offset(0, 600),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PasswordInput(
                                    lable: "EnterPassword".tr,
                                    onTextChange: () {},
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PasswordInput(
                                    lable: "ReEnterPassword".tr,
                                    onTextChange: () {},
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  iconButton(
                                    onClick: () {},
                                    text: "Submit".tr,
                                  ),
                                ],
                              ),
                              AuthTopText(width: width, title: "SetPassword".tr)
                            ],
                          ),
                        ),
                      ),
                    )),
                // Positioned(
                //     top: 0,
                //     left: 0,
                //     right: 0,
                //     child: Animate(
                //       effects: const [
                //         // FadeEffect(delay: Duration(milliseconds: 800)),
                //         // MoveEffect()
                //         MoveEffect(
                //             begin: Offset(0, -200),
                //             curve: Curves.easeInOut,
                //             delay: Duration(milliseconds: 000),
                //             duration: Duration(milliseconds: 600)),
                //       ],
                //       child: Container(
                //         height: 100,
                //         width: 100,
                //         child: Image.asset('assets/images/logo.jpeg',
                //             height: 200,
                //             scale: 2.5,
                //             // color: Color.fromARGB(255, 15, 147, 59),
                //             opacity: const AlwaysStoppedAnimation<double>(0.5)),
                //       ),
                //     ))
              ],
            ),
          ),
        ));
  }
}
