import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  Future<String?> _authUser(LoginData data) async {
    return Future.delayed(const Duration(seconds: 2)).then((_) {
      if (data.password == "123456" && data.name == "72722798") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashboardView(
            title: "",
          ),
        )); // genericPopup(context, title: "", children: Column()).show();

        // return 'Enter your otp here';
      } else {
        return "Invalid Phone or password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SaloonsController());

    Get.put(ShopsController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Get.put(CartController());
    Get.put(HelperController());

    return FlutterLogin(
      title: 'Beauty Queen',

      userValidator: (value) {
        if (value!.length > 8 || value.length < 8) {
          return "Invalid Phone Number";
        } else {
          null;
        }
        return null;
      },
      userType: LoginUserType.phone,

      theme: LoginTheme(
          primaryColor: primaryColor,
          accentColor: secandaryColor,
          errorColor: Colors.deepOrange,
          titleStyle: const TextStyle(
            color: dashbboardTitleColor,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          )),
      // logo: const AssetImage('assets/images/ecorp.png'),
      // onLogin: (_) => Future(() async {
      //   // await genericPopup(context, title: "", children: Column()).show();
      //   return "pass incorrect";
      // }),
      onLogin: _authUser,

      onSignup: (_) => Future(() => null),
      onSubmitAnimationCompleted: () {
        // genericPopup(context, title: "", children: Column()).show();
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const DashboardView(
        //     title: "",
        //   ),
        // ));
        return null;
      },
      onRecoverPassword: (_) => Future(() => null),
    );
  }
}
