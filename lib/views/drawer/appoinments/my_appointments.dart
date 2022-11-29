import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/products/shops_list_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/views/products/shop_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointmentsList extends StatefulWidget {
  const MyAppointmentsList({Key? key}) : super(key: key);
  @override
  State<MyAppointmentsList> createState() => _MyAppointmentsList();
}

class _MyAppointmentsList extends State<MyAppointmentsList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "My Appointments"),
      body: SafeArea(
        child: Center(child: Text("No data available")),
      ),
    );
  }
}
