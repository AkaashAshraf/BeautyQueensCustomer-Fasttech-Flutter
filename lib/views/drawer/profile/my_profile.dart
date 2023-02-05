import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/textInputs/text_input.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Profile".tr, showCart: false),
      body: SafeArea(
        child: Container(
          height: height,
          color: Colors.white,
          child: GetX<AuthController>(builder: (controller) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: height * 0.8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          textInputCustom(
                              label: "Name".tr,
                              initialValue:
                                  controller.userInfo.value.name ?? "",
                              preIcon: const Icon(
                                Icons.text_decrease,
                                size: 20,
                                color: textInputIconColor,
                              ),
                              onTextChange: (val) {}),
                          const SizedBox(
                            height: 30,
                          ),
                          textInputCustom(
                              label: "Email".tr,
                              initialValue:
                                  controller.userInfo.value.email ?? "",
                              preIcon: const Icon(
                                Icons.email,
                                size: 20,
                                color: textInputIconColor,
                              ),
                              onTextChange: (val) {}),
                          const SizedBox(
                            height: 30,
                          ),
                          textInputCustom(
                              label: "MobileNo".tr,
                              initialValue:
                                  controller.userInfo.value.contact ?? "",
                              preIcon: const Icon(
                                Icons.numbers,
                                size: 20,
                                color: textInputIconColor,
                              ),
                              maxLength: 8,
                              onTextChange: (val) {}),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: iconButton(
                      onClick: () {
                        Navigator.pop(context);
                      },
                      text: "Update".tr,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
