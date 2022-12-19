import 'dart:developer';

import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/config/sub_urls.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/models/auth/login.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  RxBool checkValidation = false.obs;
  RxString contact = "".obs;
  RxString password = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  login() async {
    if (contact.value.length < 8) {
      ToastMessages.showError("Please Enter a valid mobile number");
      return;
    }
    if (password.value.isEmpty) {
      ToastMessages.showError("Please Enter password");
      return;
    }
    loading(true);
    try {
      var response = await post(
          loginUrl, {"user_name": contact.value, "password": password.value});
      inspect(response);
      if (response.statusCode == 200) {
        var jsonData = loginFromJson(response.body);
        MyApp().storage.write(tokenPath, jsonData.data!.token);
        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        ToastMessages.showSuccess("Logged in successfully");
        // Get.to(const DashboardView(title: ""));
        Get.offAll(const DashboardView(title: ""));

        // Get.toEnd(() => const DashboardView(title: ""));
      } else {
        ToastMessages.showSuccess("Logged in successfully bnbn");
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }
}
