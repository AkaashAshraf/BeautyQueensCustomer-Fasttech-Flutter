import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:flutter/material.dart';

Card employeesListItem(Employee employee,
    {required dynamic onPress, required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

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
            height: width * 0.1,
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
                          fontSize: getTextSize(context).twoColumnGridMainText,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        employee.countryEn.toString(),
                        style: TextStyle(
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secondaryTextColor),
                      ),
                      Text(
                        "${employee.exp.toString()} years",
                        style: TextStyle(
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
