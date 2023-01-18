import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/labels/auth_top_label.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/password_input.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/text_input.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:beauty_queens_ustomer/views/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: noAppBar(),
        body: SafeArea(
          child: GetX<AuthController>(builder: (controller) {
            return Container(
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
                                    textInputCustom(
                                        label: "Enter Mobile No",
                                        initialValue:
                                            controller.contact.toString(),
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        maxLength: 8,
                                        onTextChange: (val) {
                                          controller.contact.value = val;
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    PasswordInput(
                                      lable: "Enter Password",
                                      onTextChange: (val) {
                                        controller.password.value = val;
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(const ForgetPassword(title: ""));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: width,
                                            child: const Text(
                                              "forget password",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    controller.loading.value
                                        ? const LoadingIndicatore()
                                        : iconButton(
                                            onClick: () {
                                              controller.login();
                                            },
                                            text: "Login",
                                          ),
                                  ],
                                ),
                                AuthTopText(width: width, title: "Login")
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
            );
          }),
        ));
  }
}
