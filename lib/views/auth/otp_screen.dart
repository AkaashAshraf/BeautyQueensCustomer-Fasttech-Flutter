import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/labels/auth_top_label.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/views/auth/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OTPScreen> createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
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
                                  OTPTextField(
                                    length: 4,
                                    width: MediaQuery.of(context).size.width,
                                    fieldWidth: width / 8,
                                    style: const TextStyle(fontSize: 17),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.box,
                                    onCompleted: (pin) {
                                      // print("Completed: " + pin);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  iconButton(
                                    onClick: () {
                                      Get.to(const PasswordScreen(title: ""));
                                    },
                                    text: "Submit".tr,
                                  ),
                                ],
                              ),
                              AuthTopText(width: width, title: "OTPScreen".tr)
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
