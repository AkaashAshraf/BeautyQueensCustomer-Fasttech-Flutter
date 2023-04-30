import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/dotted_line.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/saloons/saloon_service_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:beauty_queens_ustomer/views/saloons/employees_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SaloonDetailsView extends StatefulWidget {
  const SaloonDetailsView({Key? key, required this.saloon}) : super(key: key);
  final Saloon saloon;

  @override
  State<SaloonDetailsView> createState() => _SaloonDetailsView();
}

class _SaloonDetailsView extends State<SaloonDetailsView> {
  HelperController helperController = Get.find<HelperController>();

  // var employees;
  // var services;
  // Employee? employees;
  // List<Employee> employees = [];
  List<Service> services = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getInitializeObjects();
  }

  getInitializeObjects() async {
    controller.fetchEmployeesList(id: widget.saloon.id ?? 0);
  }

  SaloonsController controller = Get.put(SaloonsController());

  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(
          title: Get.locale.toString() == "en"
              ? widget.saloon.nameEn ?? ''
              : widget.saloon.nameAr ?? ""),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              // height: height * 0.89,
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
                          child: Image.network(
                            "$imageBaseUrl/${widget.saloon.imagePath}",
                            fit: BoxFit.cover,
                            height: height * 0.28,
                            width: width,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
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
                                          ? widget.saloon.nameEn ?? ""
                                          : widget.saloon.nameAr ?? "",
                                      textStyle: TextStyle(
                                          fontSize: width * 0.05,
                                          fontFamily: "primary",
                                          fontWeight: FontWeight.w600,
                                          color: titleColor),
                                      colors: [primaryColor, secandaryColor],
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              ),
                              //   Text(
                              //     widget.saloon.nameEn!,
                              //     style: TextStyle(
                              //         fontSize: width * 0.045,
                              //         fontWeight: FontWeight.w500,
                              //         color: titleColor),
                              //   ),
                              // ),
                              const SizedBox(height: 5),
                              Row(
                                textDirection: Get.locale.toString() == "en"
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                children: [
                                  Text(
                                    Get.locale.toString() == "en"
                                        ? widget.saloon.cityEn ?? ""
                                        : widget.saloon.cityAr ?? "",
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontFamily: "primary",
                                        color: secondaryTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const Text(
                              //       "08:00 AM - 08:00 PM",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                textDirection: Get.locale.toString() == "en"
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${widget.saloon.openTime1}-${widget.saloon.closeTime1}",
                                        style: const TextStyle(
                                            color: secondaryTextColor,
                                            fontFamily: "primary"),
                                      ),
                                      Text(
                                        "${widget.saloon.openTime2}-${widget.saloon.closeTime2}",
                                        style: const TextStyle(
                                            color: secondaryTextColor,
                                            fontFamily: "primary"),
                                      ),
                                    ],
                                  ),
                                  helperController.isProviderOpen(
                                      open1: widget.saloon.openTime1 ?? "",
                                      open2: widget.saloon.openTime2 ?? "",
                                      close1: widget.saloon.closeTime1 ?? "",
                                      close2: widget.saloon.closeTime2 ?? "")
                                ],
                              ),

                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      Get.to(const EmployeesListView());
                                    }),
                                    child: Text(
                                      "ViewEmployees".tr,
                                      style: const TextStyle(
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
                                        initialRating:
                                            widget.saloon.ratters == 0
                                                ? 0
                                                : widget.saloon.stars /
                                                    widget.saloon.ratters,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          size: 10,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Text(
                                        widget.saloon.ratters == 0
                                            ? "0"
                                            : "${(widget.saloon.stars / widget.saloon.ratters).toStringAsFixed(1)} / ${widget.saloon.ratters}",
                                        style: const TextStyle(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * 0.7,
                                      child: Text(
                                        widget.saloon.descriptionEn ?? "",
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
                                              "${"Contact".tr} ${Get.locale.toString() == "en" ? widget.saloon.nameEn : widget.saloon.nameAr}",
                                          children: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                width: width * 0.5,
                                                child: iconButton(
                                                  onClick: () {
                                                    Get.put(HelperController())
                                                        .openUrl(
                                                            url:
                                                                "tel:+968${widget.saloon.contact}");
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
                                                    Get.put(HelperController())
                                                        .openUrl(
                                                            url:
                                                                "whatsapp://send?phone=${widget.saloon.contact}&text=");
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
                                        latitude: widget.saloon.latitude,
                                        longitude: widget.saloon.longitude,
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
                  for (var i = 0; i < widget.saloon.services!.length; i++)
                    serviceItem(cardHeight, context,
                        service: widget.saloon.services![i],
                        saloon: widget.saloon,
                        cartController: cartController),

                  // ListView.builder(
                  //     itemCount: widget.controller.saloonsList.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  //         child: SizedBox(
                  //             height: cardHeight,
                  //             // width: width * 0.95,

                  //             child: Padding(
                  //               padding: const EdgeInsets.only(left: 0, right: 0),
                  //               child: Card(
                  //                 elevation: 5,
                  //                 child: Stack(
                  //                   children: [
                  //                     Row(
                  //                       crossAxisAlignment: CrossAxisAlignment.center,
                  //                       children: [
                  //                         ClipRRect(
                  //                           borderRadius: BorderRadius.circular(5.0),
                  //                           child: Image.network(
                  //                             imageBaseUrl +
                  //                                 widget.controller.saloonsList[index]
                  //                                     .imagePath
                  //                                     .toString(),
                  //                             fit: BoxFit.fill,
                  //                             height: cardHeight,
                  //                             width: cardHeight * 0.99,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: cardHeight,
                  //                           child: Padding(
                  //                             padding: const EdgeInsets.all(8.0),
                  //                             child: Column(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.spaceAround,
                  //                               children: [
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Text(
                  //                                     widget
                  //                                             .controller
                  //                                             .saloonsList[index]
                  //                                             .nameEn ??
                  //                                         "",
                  //                                     style: TextStyle(
                  //                                         color: titleColor,
                  //                                         fontSize:
                  //                                             getTextSize(context)
                  //                                                 .smallItemMainText),
                  //                                   ),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Text(
                  //                                     "Time : 20 mins",
                  //                                     maxLines: 1,
                  //                                     style: TextStyle(
                  //                                         color: secondaryTextColor,
                  //                                         fontSize:
                  //                                             getTextSize(context)
                  //                                                 .smallItemSubText),
                  //                                   ),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Text(
                  //                                         "Price : 2.2 OMR",
                  //                                         maxLines: 1,
                  //                                         style: TextStyle(
                  //                                             color:
                  //                                                 secondaryTextColor,
                  //                                             fontSize: getTextSize(
                  //                                                     context)
                  //                                                 .smallItemSubText),
                  //                                       ),
                  //                                       // Icon(
                  //                                       //   Icons.shopping_cart,
                  //                                       //   size: 18,
                  //                                       //   color: primaryColor,
                  //                                       // ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Positioned(
                  //                       bottom: 5,
                  //                       right: 10,
                  //                       child: Icon(
                  //                         Icons.shopping_cart,
                  //                         size: 22,
                  //                         color: primaryColor,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )),
                  //       );
                  //     }),
                  // // ServicesTab(
                  //   saloonID: widget.saloon.id!,
                  //   services: services,
                  // ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
