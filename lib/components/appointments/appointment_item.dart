import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/appointment.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    Key? key,
    required this.height,
    required this.item,
    required this.width,
  }) : super(key: key);

  final double height;
  final Appointment item;

  final double width;

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              // shadow direction: bottom right
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Appointment #:",
                    style: TextStyle(
                        fontFamily: "primary",
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.id.toString(),
                    style: TextStyle(
                        fontFamily: "primary",
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const DottedLine(
                dashColor: bgColor,
                dashGapColor: bgColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.85,
                    child: Text(
                      "Saloon Name",
                      style: TextStyle(
                          fontFamily: "primary",
                          color: Colors.grey,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.85,
                    child: Text(
                      item.saloon.nameEn.toString(),
                      style: TextStyle(
                          fontFamily: "primary",
                          color: Colors.black,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              textRow(
                  title1: "Date",
                  title2: "Status",
                  textColor1: Colors.grey,
                  textColor2: Colors.grey),
              textRow(
                title1: item.appointmentDateTime,
                title2: helperController.getStatusMessage(item.status),
                textColor1: Colors.black,
                textColor2: helperController.getStatusColor(item.status),
              ),
              const SizedBox(
                height: 5,
              ),
              textRow(
                  title1: "Total Services",
                  title2: "Total Amount",
                  textColor1: Colors.grey,
                  textColor2: Colors.grey),
              textRow(
                  title1: item.requestedServices.length.toString(),
                  title2: "${item.totalAmount.toStringAsFixed(3)} OMR",
                  textColor1: Colors.black,
                  textColor2: primaryColor),
              const SizedBox(
                height: 5,
              ),
              textRow(
                  title1: "Employess",
                  title2: item.employee.nameEn,
                  textColor1: Colors.grey,
                  textColor2: Colors.black),
              const SizedBox(
                height: 5,
              ),
              const DottedLine(
                dashColor: bgColor,
                dashGapColor: bgColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  for (int i = 0; i < item.requestedServices.length; i++)
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          child: Text(
                            "${(i + 1).toString()}- ${item.requestedServices[i].providerService!.generalService.nameEn} x 1 ",
                            style: TextStyle(
                                fontFamily: "primary",
                                color: Colors.grey,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "1 x ${item.requestedServices[i].providerService!.charges.toString()}",
                            style: TextStyle(
                                fontFamily: "primary",
                                color: Colors.grey,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row textRow(
      {required String title1,
      required String title2,
      required Color textColor1,
      required Color textColor2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.5,
          child: Text(
            title1,
            style: TextStyle(
                fontFamily: "primary",
                color: textColor1,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
            title2,
            style: TextStyle(
                fontFamily: "primary",
                fontSize: width * 0.035,
                color: textColor2,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
