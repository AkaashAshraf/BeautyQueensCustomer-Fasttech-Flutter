import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/labels/auth_top_label.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/password_input.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/text_input.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
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
                            duration: Duration(milliseconds: 800)),
                      ],
                      child: Container(
                        height: height * 0.6,
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
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    textInputCustom(
                                        label: "Enter Mobile No",
                                        initialValue: "",
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        maxLength: 8,
                                        onTextChange: (val) {}),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textInputCustom(
                                        label: "Enter Name",
                                        initialValue: "",
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        onTextChange: (val) {}),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PasswordInput(
                                      lable: "Enter Password",
                                      onTextChange: () {},
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PasswordInput(
                                      lable: "Re-enter Password",
                                      onTextChange: () {},
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    iconButton(
                                      onClick: () {},
                                      text: "SignUp",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              AuthTopText(width: width, title: "SIGNUP")
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
