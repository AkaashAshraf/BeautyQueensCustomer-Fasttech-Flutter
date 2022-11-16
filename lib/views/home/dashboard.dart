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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image(
                  fit: BoxFit.fitHeight,
                  // opacity: AlwaysStoppedAnimation<double>(0.4),
                  image: AssetImage('assets/images/logo.jpeg')),
            ),
            ListTile(
              leading: const Icon(
                Icons.my_library_books_outlined,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('My Appointments'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notification_important,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Notifications'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.password,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Change Password'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Change Language to Arabic'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
                                  imgName: "new_salons.jpeg",
                                  title: "Beauty Centres", onTap: () {
                                Get.to(const SaloonsListView());
                              }),
                              dashboardItem(height, width,
                                  imgName: "spa.jpg", title: "SPA", onTap: () {
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
                                  imgName: "ladies_gym.jpg",
                                  title: "Ladies Gym",
                                  onTap: () {}),
                              dashboardItem(height, width,
                                  imgName: "offerss.jpeg",
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
                                  imgName: "beauty_products.jpeg",
                                  title: "Beauty Products", onTap: () {
                                Get.put(ShopsController()).fetchShopsList();

                                Get.to(const ShopsListView());
                              }),
                              dashboardItem(height, width,
                                  imgName: "s_support.jpeg",
                                  title: "Customer Support",
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
