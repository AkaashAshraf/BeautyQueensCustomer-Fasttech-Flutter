import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/views/home/dashboard.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxInt selectedEmployee = 0.obs;
  Rx<Saloon> selectedSaloon = Saloon().obs;
  RxInt saloonID = 0.obs;

  RxList<Employee> employeesList = <Employee>[].obs;

  double get totalPriceAfterDiscount =>
      items.fold(0, (sum, item) => sum + (item.discountedPrice));
  double get totalPrice => items.fold(0, (sum, item) => sum + (item.unitPrice));
  double get totalTime => items.fold(0, (sum, item) => sum + (item.time));

  RxBool loading = false.obs;

  RxBool saloonListLoading = false.obs;

  fetchEmployees(int id) async {
    employeesList.value =
        await Get.put(SaloonsController()).fetchEmployeesList(id: id);
  }

  emptyCart() {
    items.value = [];
    ToastMessages.showSuccess("CartHasBeenClearedSuccessfully".tr);
  }

  bool addToCart(CartItem item, Saloon saloon) {
    saloonID.value = item.providerID;
    var contain = items.where((element) => element.productID == item.productID);
    if (contain.isEmpty) {
      items.add(item);
      ToastMessages.showSuccess("AddedToCart".tr);
      // if (items.length == 1) {
      selectedSaloon.value = saloon;
      fetchEmployees(selectedSaloon.value.id ?? 0);
      // }

      return true;
    } else {
      return false;
    }
  }

  checkout({required String datetime}) async {
    // print(datetime);
    // return;

    try {
      loading(true);
      if (datetime.isEmpty) {
        ToastMessages.showError("PleaseSelectAppointmentDateTime".tr);
        return;
      }
      if (selectedEmployee.value == 0) {
        ToastMessages.showError("PleaseSelectEmployee".tr);
        return;
      }
      if (items.isEmpty) {
        ToastMessages.showError("PleaseSelectServices".tr);
        return;
      }
      var map = new Map<String, dynamic>();
      var userid = MyApp().storage.read(userIDPath);

      map['user_id'] = userid.toString();
      map['emp_id'] = selectedEmployee.toString();
      map['date'] = datetime;
      map['saloon_id'] = selectedSaloon.value.id.toString();
      // map['service_ids[0]'] = '6';
      for (int i = 0; i < items.length; i++) {
        map['service_ids[${i.toString()}]'] = items[i].productID.toString();
      }
      var res = await post("/client/appointment/add", map);
      // ToastMessages.showError(res.statusCode.toString());
      // print(res.statusCode.toString());
      loading(false);
      if (res?.statusCode == 200) {
        ToastMessages.showSuccess("AppointmentSuccessToast".tr);
        items.value = [];
        Get.offAll(const DashboardView(title: ""));
      } else {
        // ToastMessages.showError("Something went wrong");
      }
    } catch (e) {
    } finally {
      loading(false);
    }
  }
}
