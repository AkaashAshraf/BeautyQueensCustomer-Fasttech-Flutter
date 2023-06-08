import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/components/saloons/employees_list_item2.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);
  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  String dateTime = "";
  String date = "";
  String time = "";

  // Time time = Time(hour: 12, minute: 12);
  initDatePicker(BuildContext context) async {
    // newDateTime = await showRoundedDatePicker(context: context);
  }

  @override
  void initState() {
    initDatePicker(context);
    super.initState();
  }

  DateTime? newDateTime;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: appBar(
            showCart: false,
            title: Get.put(CartController())
                .selectedSaloon
                .value
                .nameEn
                .toString()),
        body: SafeArea(child: GetX<CartController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                  height: height * 0.9,
                  child: controller.items.isNotEmpty
                      ? Stack(
                          children: [
                            Column(
                              children: [
                                // BottomPicker.time(
                                //     title: "Set your next meeting time",
                                //     titleStyle: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 15,
                                //         color: Colors.orange),
                                //     onSubmit: (index) {
                                //       print(index);
                                //     },
                                //     onClose: () {
                                //       print("Picker closed");
                                //     },
                                //     // bottomPickerTheme:  BOTTOM_PICKER_THEME.orange,
                                //     use24hFormat: true),
                                GestureDetector(
                                  onTap: () async {
                                    newDateTime = await showRoundedDatePicker(
                                        fontFamily: "primary",
                                        context: context,
                                        styleDatePicker:
                                            MaterialRoundedDatePickerStyle(
                                          textStyleDayOnCalendarSelected:
                                              const TextStyle(
                                                  color: Colors.white),
                                          textStyleYearButton: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        theme: ThemeData(
                                            primarySwatch: mainAppColor),
                                        locale: Locale(Get.locale.toString()),
                                        customWeekDays: [
                                          "sun".tr,
                                          "mon".tr,
                                          "tue".tr,
                                          "wed".tr,
                                          "thu".tr,
                                          "fri".tr,
                                          "sat".tr
                                        ],
                                        textPositiveButton: "ok".tr,
                                        textNegativeButton: "cancel".tr,
                                        okHandler: (DateTime val) {
                                          // print(val);
                                          setState(() {
                                            date =
                                                "${val.year}-${val.month < 10 ? "0" : ""}${val.month}-${val.day < 10 ? "0" : ""}${val.day}";
                                          });
                                        });
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: width,
                                        child: Text(
                                          "AppointmentDate".tr,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04,
                                              fontFamily: "primary"),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.punch_clock,
                                            color: Colors.grey,
                                            // size: 30.0,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: width * 0.85,
                                            decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        5.0))), // height: 20,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                date,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "primary"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                DateTimePicker(
                                  initialValue: '',
                                  timeLabelText: "enterTime".tr,
                                  // cancelText: "cancel".tr,
                                  // errorFormatText: "invalidFormat".tr,
                                  // errorInvalidText: "invalidText".tr,
                                  // locale: Locale("ar", "OM"),
                                  timePickerEntryModeInput: true,
                                  type: DateTimePickerType.time,
                                  icon: const Icon(Icons.calendar_month),
                                  // firstDate: DateTime(2000),
                                  // lastDate: DateTime(2100),

                                  dateLabelText: 'enterTime'.tr,
                                  onChanged: (val) => {
                                    setState(() {
                                      time = val;
                                    })
                                  },
                                  validator: (val) {
                                    return null;
                                  },
                                  onSaved: (val) => setState(() {
                                    dateTime = val ?? "";
                                  }),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: height * 0.03,
                                    width: width,
                                    child: Text(
                                      "ChooseEmployee".tr,
                                      style: TextStyle(
                                          fontFamily: "primary",
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.33,
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 8.0,
                                    children: List.generate(
                                        controller.employeesList
                                            .where((p0) => p0.empId != 0)
                                            .length, (index) {
                                      return Center(
                                          child: SizedBox(
                                        // width: 200,
                                        child: employeesListItem2(
                                            controller.employeesList
                                                .where((p0) => p0.empId != 0)
                                                .toList()[index],
                                            context: context,
                                            onPress: (Employee employee) {
                                          controller.selectedEmployee.value =
                                              employee.empId!;
                                        }),
                                      ));
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.3,
                                  child: DataTable2(
                                      dataRowColor: MaterialStateProperty.all(
                                          Colors.white),
                                      columnSpacing: 12,
                                      horizontalMargin: 12,
                                      minWidth: width * 0.9,
                                      columns: [
                                        DataColumn2(
                                          label: Text(
                                            'Number'.tr,
                                            style: const TextStyle(
                                                fontFamily: "primary",
                                                fontWeight: FontWeight.w600),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            'ServiceName'.tr,
                                            style: const TextStyle(
                                                fontFamily: "primary",
                                                fontWeight: FontWeight.w600),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            'Time'.tr,
                                            style: const TextStyle(
                                                fontFamily: "primary",
                                                fontWeight: FontWeight.w600),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            'Price'.tr,
                                            style: const TextStyle(
                                                fontFamily: "primary",
                                                fontWeight: FontWeight.w600),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                          controller.items.length,
                                          (index) => DataRow(cells: [
                                                DataCell(Text(
                                                  (index + 1).toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "primary"),
                                                )),
                                                DataCell(Text(
                                                  Get.locale.toString() == "en"
                                                      ? controller
                                                          .items[index].nameEn
                                                      : controller
                                                          .items[index].nameAr,
                                                  style: const TextStyle(
                                                      fontFamily: "primary"),
                                                )),
                                                DataCell(Text(
                                                  controller.items[index].time
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: "primary"),
                                                )),
                                                DataCell(Text(
                                                  "${controller.items[index].discountedPrice.toStringAsFixed(3)} ${"OMR".tr}",
                                                  style: const TextStyle(
                                                      fontFamily: "primary"),
                                                )),
                                              ]))),
                                ),
                                const DottedLine(),
                                SizedBox(
                                  width: width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${"Services".tr} ${controller.items.length.toString()}",
                                          style: TextStyle(
                                              fontFamily: "primary",
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${"Time:".tr} ${controller.totalTime.toString()}",
                                          style: TextStyle(
                                              fontFamily: "primary",
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${"Amount:".tr} ${controller.totalPriceAfterDiscount.toStringAsFixed(3)} ${"OMR".tr}",
                                          style: TextStyle(
                                              fontFamily: "primary",
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const DottedLine(),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: controller.loading.value
                                  ? const Center(child: LoadingIndicatore())
                                  : SizedBox(
                                      width: width * 0.9,
                                      height: height * 0.05,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (date.isEmpty || time.isEmpty) {
                                              ToastMessages.showError(
                                                  "PleaseSelectAppointmentDateTime"
                                                      .tr);
                                              return;
                                            }
                                            controller.checkout(
                                                datetime: "$date $time");
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      primaryColor)),
                                          child: Text(
                                            "Checkout".tr,
                                            style: TextStyle(
                                                fontFamily: "primary",
                                                color: Colors.white,
                                                fontSize: width * 0.045),
                                          )),
                                    ),
                            )
                          ],
                        )
                      : Center(
                          child: Text(
                          "CartIsEmpty".tr,
                          style: const TextStyle(
                            fontFamily: "primary",
                          ),
                        ))),
            ),
          );
        })));
  }
}
