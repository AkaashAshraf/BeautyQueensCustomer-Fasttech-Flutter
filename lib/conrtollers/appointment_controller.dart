import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/models/response/appoinment_list.dart';
import 'package:beauty_queens_ustomer/models/simple/appointment.dart';
import 'package:get/get.dart';

class AppoinmentController extends GetxController {
  RxBool loading = false.obs;
  RxList<Appointment> appoinments = <Appointment>[].obs;

  @override
  void onInit() {
    fetchAppoinments();
    super.onInit();
  }

  fetchAppoinments() async {
    try {
      var userid = MyApp().storage.read(userIDPath);
      // ToastMessages.showSuccess(userid);
      loading(true);
      final result = await post(
          "/client/appointments/my-list", {"user_id": userid.toString()});
      if (result != null) {
        final products = appointmentsFromJson(result?.body);
        appoinments.value = products.data.reversed.toList();
        return products.data;
      }
    } finally {
      loading(false);
    }
  }
}
