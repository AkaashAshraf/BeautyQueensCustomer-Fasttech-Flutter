import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/labels/auth_top_label.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/components/common/logo_image.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/password_input.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/text_input.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: noAppBar(showCart: false),
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
              child: Column(
                children: [
                  Expanded(child: LogoImage(height: height)),

                  // const Text("Dalilee Shiper "),
                  Animate(
                    effects: const [
                      // FadeEffect(delay: Duration(milliseconds: 800)),
                      // MoveEffect()
                      MoveEffect(
                          begin: Offset(0, 800),
                          curve: Curves.easeInOut,
                          delay: Duration(milliseconds: 000),
                          duration: Duration(milliseconds: 800)),
                    ],
                    child: SingleChildScrollView(
                      child: Container(
                        height: height * 0.63,
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
                                        label: "EnterMobileNo".tr,
                                        initialValue: "",
                                        keyboardType: TextInputType.number,
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        maxLength: 8,
                                        onTextChange: (val) {
                                          // ToastMessages.showError(val);
                                          controller.contact.value =
                                              val.toString();
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textInputCustom(
                                        label: "EnterName".tr,
                                        initialValue: controller.name.value,
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        onTextChange: (val) {
                                          controller.name.value = val;
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PasswordInput(
                                      lable: "EnterPassword".tr,
                                      onTextChange: (val) {
                                        controller.password.value = val;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PasswordInput(
                                      lable: "ReEnterPassword".tr,
                                      onTextChange: (val) {
                                        controller.confirmPassword.value = val;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    controller.loading.value
                                        ? const LoadingIndicatore()
                                        : iconButton(
                                            onClick: () {
                                              controller.signUp();
                                            },
                                            text: "SignUp".tr,
                                          ),
                                    const SizedBox(
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              AuthTopText(width: width, title: "SignUp".tr)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
