import 'package:beauty_queens_ustomer/components/appointments/appointment_item.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({Key? key, required this.type}) : super(key: key);
  final int type; //1 pending //2 completed // 3 cancelled
  @override
  State<AppointmentTab> createState() => _AppointmentTab();
}

class _AppointmentTab extends State<AppointmentTab> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppoinmentController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<AppoinmentController>(builder: (controller) {
        return SafeArea(
            child: controller.loading.value == false &&
                    (widget.type == 0
                        ? controller.appoinments.isEmpty
                        : controller.appoinments
                            .where((element) => element.status == widget.type)
                            .isEmpty)
                ? Center(
                    child: Text(
                    "No appointments available",
                    style: TextStyle(
                        fontFamily: "primary",
                        fontSize: screenWidth(context) * 0.04),
                  ))
                : controller.loading.value == true &&
                        (widget.type == 0
                            ? controller.appoinments.isEmpty
                            : controller.appoinments
                                .where(
                                    (element) => element.status == widget.type)
                                .isEmpty)
                    ? const Center(child: LoadingIndicatore())
                    : ListView.builder(
                        itemCount: widget.type == 0
                            ? controller.appoinments.length
                            : controller.appoinments
                                .where(
                                    (element) => element.status == widget.type)
                                .length,
                        itemBuilder: (context, index) {
                          return AppointmentItem(
                            height: height,
                            width: width,
                            item: widget.type == 0
                                ? controller.appoinments[index]
                                : controller.appoinments
                                    .where((element) =>
                                        element.status == widget.type)
                                    .toList()[index],
                          );
                        },
                      ));
      }),
    );
  }
}
