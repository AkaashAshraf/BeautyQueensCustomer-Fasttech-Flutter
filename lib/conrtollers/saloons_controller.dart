import 'package:beauty_queens_ustomer/http/http.dart';
import 'package:beauty_queens_ustomer/models/providers/providers_list.dart';
import 'package:beauty_queens_ustomer/models/response/employee_list.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:get/state_manager.dart';

class SaloonsController extends GetxController {
  RxList<Saloon> saloonsList = <Saloon>[].obs;
  RxList<Employee> employees = <Employee>[].obs;

  RxBool saloonListLoading = false.obs;

  @override
  void onInit() {
    fetchSaloonsList();
    super.onInit();
  }

  sort({required bool topRate, required bool mostRate, required bool nearBy}) {
    if (!topRate && !mostRate && !nearBy) {
      saloonsList.sort((b, a) => a.id!.compareTo(b.id ?? 0));
    }
    if (topRate) {
      saloonsList.sort((b, a) => (a.ratters == 0 ? 0 : (a.stars / a.ratters))
          .compareTo((b.ratters == 0 ? 0 : (b.stars / b.ratters))));
    }
    if (mostRate) {
      saloonsList.sort((b, a) => a.ratters.compareTo(b.ratters));
    }
  }

  fetchSaloonsList() async {
    try {
      saloonListLoading(true);
      final result = await post("/client/salons/list", {});
      if (result != null) {
        final saloons = providersFromJson(result?.body);

        saloonsList(saloons!.data!);
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
        final employeesResulut = employeesFromJson(result?.body);
        employees.value = employeesResulut.data!;
        return employeesResulut.data;
      }
    } finally {
      saloonListLoading(false);
    }
  }
}
