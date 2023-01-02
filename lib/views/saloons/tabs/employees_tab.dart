import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

// ignore: must_be_immutable
class EmployeesTab extends StatefulWidget {
  EmployeesTab({Key? key, required this.employees}) : super(key: key);
  final controller = Get.put(SaloonsController());
  List<Employee> employees;
  @override
  State<EmployeesTab> createState() => _EmployeesTab();
}

class _EmployeesTab extends State<EmployeesTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: widget.employees.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  child: SizedBox(
                    height: 100,
                    // width: width * 0.95,
                    child: Text(
                      widget.employees[index].nameEn!,
                      style: TextStyle(fontFamily: "primary"),
                    ),
                  ));
            }),
      ),
    );
  }
}
