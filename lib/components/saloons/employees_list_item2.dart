import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

Widget employeesListItem2(Employee employee,
    {required dynamic onPress, required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return GetX<CartController>(builder: (controller) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: controller.selectedEmployee.value == employee.empId
              ? Colors.green
              : Colors.white70,
          width: controller.selectedEmployee.value == employee.empId ? 2 : 0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: GestureDetector(
        onTap: () => {onPress(employee)},
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "$imageBaseUrl/${employee.image}",
                fit: BoxFit.cover,
                height: width * 0.18,
                width: width,
              ),
            ),
            SizedBox(
              height: width * 0.09,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        employee.nameEn.toString(),
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.12,
                          child: Text(
                            employee.countryEn.toString(),
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: secondaryTextColor),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "${employee.exp.toString()} years",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: secandaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
