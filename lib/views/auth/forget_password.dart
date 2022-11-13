import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                    height: height * 0.7,
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
                            onClick: () {},
                            text: "ForgetPassword",
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
