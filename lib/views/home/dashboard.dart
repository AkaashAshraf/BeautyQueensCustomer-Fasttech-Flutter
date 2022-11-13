import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/home/dashboard/dashboard_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/views/appoinments/book_appointment.dart';
import 'package:beauty_queens_ustomer/views/products/products_shops_list_view.dart';
import 'package:beauty_queens_ustomer/views/saloons/saloon_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DashboardView> createState() => _DashboardView();
}

class _DashboardView extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    Get.put(SaloonsController());

    Get.put(ShopsController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Get.put(CartController());
    Get.put(HelperController());

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      appBar: noAppBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryColor, secandaryColor],
          )),
          height: height,
          width: width,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Beauty Queens".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: dashbboardTitleColor,
                            fontSize: width * 0.1),
                      ).animate().scale(delay: 200.ms, duration: 400.ms),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "service_1.jpg",
                                  title: "Beauty Centres", onTap: () {
                                Get.to(const SaloonsListView());
                              }),
                              dashboardItem(height, width,
                                  imgName: "salon_2.jpg",
                                  title: "SPA", onTap: () {
                                Get.to(const BookAppointmentView());
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "salon_3.jpg",
                                  title: "Ladies Gym",
                                  onTap: () {}),
                              dashboardItem(height, width,
                                  imgName: "salon_4.jpg",
                                  title: "Offers", onTap: () {
                                Get.to(DashboardView(title: ""));
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "salon_5.jpg",
                                  title: "Beauty Products", onTap: () {
                                Get.put(ShopsController()).fetchShopsList();

                                Get.to(const ShopsListView());
                              }),
                              dashboardItem(height, width,
                                  imgName: "salon_1.jpg",
                                  title: "Settings",
                                  onTap: () {}),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
