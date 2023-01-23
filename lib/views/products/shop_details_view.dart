import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/dotted_line.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/products/product_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/shop.dart';
import 'package:beauty_queens_ustomer/views/saloons/employees_list_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ShopsDetailsView extends StatefulWidget {
  ShopsDetailsView({Key? key, required this.shop}) : super(key: key);
  final Shop shop;
  final controller = Get.put(ShopsController());

  @override
  State<ShopsDetailsView> createState() => _ShopsDetailsView();
}

class _ShopsDetailsView extends State<ShopsDetailsView> {
  // var employees;
  // var services;
  // Employee? employees;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: widget.shop.nameEn!, showCart: false),
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
                        alignment: Alignment.centerLeft,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              widget.shop.nameEn!,
                              textStyle: TextStyle(
                                  fontFamily: "primary",
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: titleColor),
                              colors: [primaryColor, dashbboardTitleColor],
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
                        children: [
                          Text(
                            widget.shop.cityEn!,
                            style: const TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "08:00 AM - 11:00 PM",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),

                          Text(
                            "Open Now",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                          // DefaultTextStyle(
                          //   style: TextStyle(
                          //       // fontSize: 15.0,

                          //       fontWeight: FontWeight.bold,
                          //       color: primaryColor),
                          //   child: AnimatedTextKit(
                          //     repeatForever: true,
                          //     animatedTexts: [
                          //       FadeAnimatedText('Opened'),
                          //     ],
                          //     onTap: () {
                          //       print("Tap Event");
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Get.to(const EmployeesListView());
                            }),
                            child: const Text(
                              "",
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: "primary",
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.0,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              const Text(
                                "4.5 / 26",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "primary",
                                ),
                              ),
                            ],
                          ),
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
                              child: const Text(
                                "Description: dummy description text",
                                style: TextStyle(
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
                                  title: "Contact ${widget.shop.nameEn}",
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
                                          text: "Contact",
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
                                          text: "Whtasapp",
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
                            text: "Contact"),
                      ),
                      SizedBox(
                        width: width * 0.43,
                        child: iconButton(
                            onClick: () async {
                              Get.put(HelperController()).openLocation(
                                latitude: widget.shop,
                                longitude: widget.shop,
                              );
                            },
                            icon: const Icon(
                              size: 20,
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            text: "Location"),
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
          for (var i = 0; i < widget.shop.products!.length; i++)
            productItem(
              cardHeight,
              context,
              product: widget.shop.products![i]!,
            )
        ],
      ))),
    );
  }
}
