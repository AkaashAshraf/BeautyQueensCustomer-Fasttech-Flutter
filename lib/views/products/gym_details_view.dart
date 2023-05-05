import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/dotted_line.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/gym/package_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/gym_package.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GYMDetailsView extends StatefulWidget {
  GYMDetailsView({Key? key, required this.shop}) : super(key: key);
  final Shop shop;
  final controller = Get.put(ShopsController());

  @override
  State<GYMDetailsView> createState() => _GYMDetailsView();
}

class _GYMDetailsView extends State<GYMDetailsView> {
  // var employees;
  // var services;
  // Employee? employees;
  List<GymPackage> packages = [];

  @override
  void initState() {
    super.initState();
  }

  HelperController helperController = Get.find<HelperController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(
          title: Get.locale.toString() == "en"
              ? widget.shop.nameEn ?? ""
              : widget.shop.nameAr ?? "",
          showCart: false),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: CarouselSlider(
                        items: [
                          if (widget.shop.image1 != "")
                            Image.network(
                              "$imageBaseUrl/${widget.shop.image1}",
                              fit: BoxFit.cover,
                              height: height * 0.28,
                              width: width,
                            ),
                          if (widget.shop.image3 != "")
                            Image.network(
                              "$imageBaseUrl/${widget.shop.image3}",
                              fit: BoxFit.cover,
                              height: height * 0.28,
                              width: width,
                            ),
                        ],
                        options: CarouselOptions(
                          // height: 400,
                          aspectRatio: 14 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ))
                    // Image.network(
                    //   "$imageBaseUrl/${widget.shop.image1}",
                    //   fit: BoxFit.cover,
                    //   height: height * 0.28,
                    //   width: width,
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Get.locale.toString() == "en"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              Get.locale.toString() == "en"
                                  ? widget.shop.nameEn ?? ""
                                  : widget.shop.nameAr ?? "",
                              textStyle: TextStyle(
                                  fontFamily: "primary",
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: titleColor),
                              colors: [
                                primaryColor,
                                dashbboardTitleColor,
                                primaryColor
                              ],
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ),
                      //   Text(
                      //     widget.shop.nameEn!,
                      //     style: TextStyle(
                      //         fontSize: width * 0.045,
                      //         fontWeight: FontWeight.w500,
                      //         color: titleColor),
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: Row(
                              children: [
                                Text(
                                  Get.locale.toString() == "en"
                                      ? widget.shop.cityEn ?? ""
                                      : widget.shop.cityAr ?? "",
                                  textDirection: Get.locale.toString() == "en"
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  style: const TextStyle(
                                      color: secondaryTextColor,
                                      fontFamily: "primary"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: Text(
                              "${"KM".tr} ${widget.shop.distance.toStringAsFixed(2)}  ",
                              textDirection: Get.locale.toString() == "en"
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              style: const TextStyle(
                                  color: secondaryTextColor,
                                  fontFamily: "primary"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // const SizedBox(height: 5),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       "08:00 AM - 11:00 PM",
                      //       style: TextStyle(
                      //         color: secondaryTextColor,
                      //         fontFamily: "primary",
                      //       ),
                      //     ),

                      //     Text(
                      //       "OpenNow".tr,
                      //       style: const TextStyle(
                      //         color: secondaryTextColor,
                      //         fontFamily: "primary",
                      //       ),
                      //     ),
                      //     // DefaultTextStyle(
                      //     //   style: TextStyle(
                      //     //       // fontSize: 15.0,

                      //     //       fontWeight: FontWeight.bold,
                      //     //       color: primaryColor),
                      //     //   child: AnimatedTextKit(
                      //     //     repeatForever: true,
                      //     //     animatedTexts: [
                      //     //       FadeAnimatedText('Opened'),
                      //     //     ],
                      //     //     onTap: () {
                      //     //       print("Tap Event");
                      //     //     },
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: Get.locale.toString() == "en"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${widget.shop.openTime1}-${widget.shop.closeTime1}",
                                style: const TextStyle(
                                    color: secondaryTextColor,
                                    fontFamily: "primary"),
                              ),
                              Text(
                                "${widget.shop.openTime2}-${widget.shop.closeTime2}",
                                style: const TextStyle(
                                    color: secondaryTextColor,
                                    fontFamily: "primary"),
                              ),
                            ],
                          ),
                          helperController.isProviderOpen(
                              open1: widget.shop.openTime1 ?? "",
                              open2: widget.shop.openTime2 ?? "",
                              close1: widget.shop.closeTime1 ?? "",
                              close2: widget.shop.closeTime2 ?? "")
                        ],
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7,
                              child: Text(
                                widget.shop.description ?? "",
                                style: const TextStyle(
                                  color: secondaryTextColor,
                                  fontFamily: "primary",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.43,
                        child: iconButton(
                            onClick: () async {
                              genericPopup(context,
                                  title:
                                      "${"Contact".tr} ${Get.locale.toString() == "en" ? widget.shop.nameEn : widget.shop.nameAr}",
                                  children: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.5,
                                        child: iconButton(
                                          onClick: () {
                                            Get.put(HelperController()).openUrl(
                                                url:
                                                    "tel:+968${widget.shop.contact}");
                                            Navigator.pop(context);
                                          },
                                          text: "Contact".tr,
                                          icon: const Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: width * 0.5,
                                        child: iconButton(
                                          onClick: () {
                                            Get.put(HelperController()).openUrl(
                                                url:
                                                    "whatsapp://send?phone=${widget.shop.contact}&text=");
                                            Navigator.pop(context);
                                          },
                                          text: "Whatsapp".tr,
                                          icon: const Icon(
                                            Icons.whatsapp,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )).show();
                            },
                            icon: const Icon(
                              Icons.phone,
                              size: 20,
                              color: Colors.white,
                            ),
                            text: "Contact".tr),
                      ),
                      SizedBox(
                        width: width * 0.43,
                        child: iconButton(
                            onClick: () async {
                              Get.put(HelperController()).openLocation(
                                latitude: widget.shop.latitude,
                                longitude: widget.shop.longitude,
                              );
                            },
                            icon: const Icon(
                              size: 20,
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            text: "Location".tr),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                dottedLine(thicknes: 1),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Packages".tr,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: "primary",
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05),
                ),
              ),
            ],
          ),
          for (var i = 0; i < widget.shop.gymPackages!.length; i++)
            packageItem(
              cardHeight,
              context,
              item: widget.shop.gymPackages![i],
            )
        ],
      ))),
    );
  }
}
