import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/response/employee_list.dart';
import 'package:beauty_queens_ustomer/models/response/saloon_list.dart';
import 'package:beauty_queens_ustomer/models/response/service_list.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:get/state_manager.dart';

class SPAController extends GetxController {
  RxList<Saloon> spaList = <Saloon>[].obs;
  RxList<Service> services = <Service>[].obs;
  RxList<Employee> employees = <Employee>[].obs;

  RxBool saloonListLoading = false.obs;
  @override
  void onInit() {
    fetchSaloonsList();
    super.onInit();
  }

  fetchSaloonsList() async {
    try {
      saloonListLoading(true);
      final result = await post("/client/salons/list", {"type": "2"});
      if (result != null) {
        final saloons = saloonsFromJson(result?.body);

        spaList(saloons.data);
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
      print(result);
      if (result != null) {
        final employeesResulut = employeesFromJson(result?.body);
        employees.value = employeesResulut.data!;
        return employeesResulut.data;
      }
    } finally {
      saloonListLoading(false);
    }
  }

  fetchServicesList({required int id}) async {
    try {
      saloonListLoading(true);
      final result = await post(
          "/admin/services/list", {"user_id": id.toString(), "type": "1"});
      if (result != null) {
        final servicesResponse = servicesFromJson(result?.body);
        print(servicesResponse.toJson());
        return servicesResponse.data;
      }
    } finally {
      saloonListLoading(false);
    }
  }
}
