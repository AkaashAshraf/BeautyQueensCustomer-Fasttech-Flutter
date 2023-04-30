import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Card employeesListItem(Employee employee,
    {required dynamic onPress, required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  HelperController helperController = Get.find<HelperController>();

  return Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
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
              height: width * 0.33,
              width: width,
            ),
          ),
          SizedBox(
            // height: width * 0.15,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Get.locale.toString() == "en"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text(
                      Get.locale.toString() == "en"
                          ? employee.nameEn ?? ""
                          : employee.nameAr ?? "",
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: "primary",
                          fontSize: getTextSize(context).twoColumnGridMainText,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  ),
                  Row(
                    textDirection: Get.locale.toString() == "en"
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Get.locale.toString() == "en"
                            ? employee.countryEn ?? ""
                            : employee.countryAr ?? "",
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secondaryTextColor),
                      ),
                      Text(
                        "${employee.exp} ${"Years".tr}",
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secandaryColor),
                      ),
                    ],
                  ),
                  Row(
                    textDirection: Get.locale.toString() == "en"
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        helperController.getHolidaysName(
                          employee.holiday1,
                          employee.holiday2,
                        ),
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secondaryTextColor),
                      ),
                      Text(
                        "Holidays".tr,
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secandaryColor),
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
}
