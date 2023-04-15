import 'dart:developer';

import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/conrtollers/appointment_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:get/get.dart';

class RattingController extends GetxController {
  RxBool loading = false.obs;

  rateNow(
      {required String appointmentID,
      required String saloonRatting,
      required String employeeRatting,
      required String productRatting}) async {
    try {
      AppoinmentController appoinmentController =
          Get.find<AppoinmentController>();
      loading(true);
      var userID = MyApp().storage.read(userIDPath);

      var res = await post("/client/ratting/add", {
        "appointment_id": appointmentID,
        "saloon_ratting": saloonRatting,
        "employee_ratting": employeeRatting,
        "product_ratting": productRatting,
        "user_id": userID
      });
      // inspect(res);
      appoinmentController.fetchAppoinments();
      Get.back();
      loading(false);
    } catch (e) {
      loading(false);
    } finally {
      loading(false);
    }
  }
}
