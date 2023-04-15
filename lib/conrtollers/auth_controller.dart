import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/config/sub_urls.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/models/auth/login.dart';
import 'package:beauty_queens_ustomer/views/auth/choose_auth.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  RxBool checkValidation = false.obs;
  RxString contact = "".obs;
  RxString password = "".obs;
  RxString confirmPassword = "".obs;

  RxString name = "".obs;

  Rx<User> userInfo = User().obs;

  @override
  void onInit() {
    try {
      getUserInfoFromCache();
    } catch (e) {
      print(e.toString());
    }
    super.onInit();
  }

  logout() {
    MyApp().storage.remove(tokenPath);
    MyApp().storage.remove(userIDPath);
    MyApp().storage.remove(userNamePath);
    MyApp().storage.remove(userDataPath);
    name.value = "";
    contact.value = "";
    password.value = "";
    userInfo.value = User();

    Get.offAll(const ChooseAuth(title: ""));
  }

  getUserInfoFromCache() {
    final rawData = MyApp().storage.read(userDataPath);
    if (rawData == "" || rawData == null) return;
    final loginResponse = loginFromJson(rawData);
    userInfo.value = loginResponse.data!.user!;
  }

  login() async {
    if (contact.value.length < 8) {
      ToastMessages.showError("valid_number_alert".tr);
      return;
    }
    if (password.value.isEmpty) {
      ToastMessages.showError("valid_password_alert".tr);
      return;
    }
    loading(true);
    try {
      var response = await post(
          loginUrl, {"user_name": contact.value, "password": password.value});
      // inspect(response);
      if (response.statusCode == 200) {
        var jsonData = loginFromJson(response.body);
        MyApp().storage.write(tokenPath, jsonData.data!.token);
        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        ToastMessages.showSuccess("LoggedInSuccessfully".tr);
        // Get.to(const DashboardView(title: ""));
        getUserInfoFromCache();

        Get.offAll(const DashboardView(title: ""));
        // Get.toEnd(() => const DashboardView(title: ""));
      } else {
        ToastMessages.showSuccess("LoggedInSuccessfully".tr);
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }

  updateProfile(
      {String name = "",
      String id = "",
      String password = "",
      String contact = ""}) async {
    loading(true);
    try {
      var response = await post(updateProfileUrl,
          {"name": name, "id": id, "contact": contact, "password": password});
      // inspect(response);
      if (response.statusCode == 200) {
        var jsonData = loginFromJson(response.body);
        MyApp().storage.write(tokenPath, jsonData.data!.token);
        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        ToastMessages.showSuccess("DataUpdated".tr);
        // Get.to(const DashboardView(title: ""));
        getUserInfoFromCache();
        Get.back(); // Get.offAll(const DashboardView(title: ""));
        // Get.toEnd(() => const DashboardView(title: ""));
      } else {
        // ToastMessages.showSuccess("LoggedInSuccessfully".tr);
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }

  signUp() async {
    if (contact.value.length < 8) {
      ToastMessages.showError("valid_number_alert".tr);
      return;
    }

    if (name.value.isEmpty) {
      ToastMessages.showError("valid_name_alert".tr);
      return;
    }
    if (password.value != confirmPassword.value) {
      ToastMessages.showError("PasswordMismatch".tr);
      return;
    }
    loading(true);
    try {
      var response = await post(signUpUrl, {
        "user_name": contact.value,
        "password": password.value,
        "name": name.value
      });
      if (response != null) {
        var jsonData = loginFromJson(response.body);
        MyApp().storage.write(tokenPath, jsonData.data!.token);
        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        ToastMessages.showSuccess("LoggedInSuccessfully".tr);
        // Get.to(const DashboardView(title: ""));
        getUserInfoFromCache();
        Get.offAll(const DashboardView(title: ""));

        // Get.toEnd(() => const DashboardView(title: ""));
      } else {
        ToastMessages.showError("ThisNumberAlreadyExist".tr);
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }
}
