import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/response/employee_list.dart';
import 'package:beauty_queens_ustomer/models/response/saloon_list.dart';
import 'package:beauty_queens_ustomer/models/response/service_list.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:get/state_manager.dart';

class SaloonsController extends GetxController {
  RxList<Saloon> saloonsList = <Saloon>[].obs;
  RxList<Service> services = <Service>[
    Service(
        charges: "7.0",
        isAddedToCart: false,
        serviceAssigneeId: 1,
        assigneeImage: "/Assets/service_1.jpg",
        nameEn: "Pedicure"),
    Service(
        serviceAssigneeId: 2,
        charges: "8.0",
        isAddedToCart: false,
        assigneeImage: "/Assets/service_1.jpg",
        nameEn: "Hair Cut"),
    Service(
        serviceAssigneeId: 3,
        isAddedToCart: false,
        charges: "5.0",
        assigneeImage: "/Assets/service_1.jpg",
        nameEn: "Cleansing")
  ].obs;

  RxBool saloonListLoading = false.obs;

  @override
  void onInit() {
    fetchSaloonsList();
    super.onInit();
  }

  fetchSaloonsList() async {
    try {
      saloonListLoading(true);
      final result = await post("/client/salons/list", {});
      if (result != null) {
        final saloons = saloonsFromJson(result?.body);

        saloonsList(saloons.data);
      }
    } finally {
      saloonListLoading(false);
    }
  }

  fetchEmployeesList({required int id}) async {
    try {
      saloonListLoading(true);
      final result =
          await post("/admin/employees/list", {"user_id": id.toString()});
      if (result != null) {
        final employees = employeesFromJson(result?.body);
        return employees.data;
      }
    } finally {
      saloonListLoading(false);
    }
  }

  fetchServicesList({required int id}) async {
    try {
      saloonListLoading(true);
      final result =
          await post("/admin/services/list", {"user_id": "1", "type": "1"});
      if (result != null) {
        final employees = servicesFromJson(result?.body);
        print(employees.toJson());
        return employees.data;
      }
    } finally {
      saloonListLoading(false);
    }
  }
}
