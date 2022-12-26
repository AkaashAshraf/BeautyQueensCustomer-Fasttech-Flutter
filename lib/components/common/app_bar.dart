import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:beauty_queens_ustomer/views/home/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

AppBar noAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: primaryColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: primaryColor,

      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    actions: [
      GetX<CartController>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {
                    // Get.put(CartController()).items.add(Service());
                  },
                  child: Stack(
                    children: <Widget>[
                      const IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      false
                          ? SizedBox()
                          : Positioned(
                              child: GestureDetector(
                              onTap: () {
                                Get.to(Cart());
                              },
                              child: Stack(
                                children: <Widget>[
                                  Icon(Icons.brightness_1,
                                      size: 20.0, color: Colors.green[800]),
                                  Positioned(
                                      top: 4.0,
                                      bottom: 4.0,
                                      right: 4.0,
                                      left: 4.0,
                                      child: Center(
                                        child: Text(
                                          controller.items.length.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ],
                              ),
                            )),
                    ],
                  ),
                )));
      })
    ],
  );
}

AppBar appBar({required String title}) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
    ),
    elevation: 1,
    actions: [
      GetX<CartController>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const Cart());
                    // Get.put(CartController()).items.add(Service());
                  },
                  child: Stack(
                    children: <Widget>[
                      const IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      if (controller.items.isNotEmpty)
                        Positioned(
                            child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.green[800]),
                            Positioned(
                                top: 4.0,
                                bottom: 4.0,
                                right: 4.0,
                                left: 4.0,
                                child: Center(
                                  child: Text(
                                    controller.items.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                    ],
                  ),
                )));
      })
    ],
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: appBarTitleColor),
      textAlign: TextAlign.center,
    ),
    backgroundColor: primaryColor,
    // shadowColor: Colors.black,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color

      statusBarColor: primaryColor,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );
}
