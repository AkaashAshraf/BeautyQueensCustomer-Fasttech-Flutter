import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/dotted_line.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/products/product_item.dart';
import 'package:beauty_queens_ustomer/components/saloons/saloon_service_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/models/offers/offers_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferDetailsView extends StatefulWidget {
  OfferDetailsView({Key? key, required this.item}) : super(key: key);
  final Offer item;
  final controller = Get.put(ShopsController());

  @override
  State<OfferDetailsView> createState() => _OfferDetailsView();
}

class _OfferDetailsView extends State<OfferDetailsView> {
  // var employees;
  // var services;
  // Employee? employees;
  bool bigView = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height * 0.1;
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(
          title: "Offer Details",
          showCart: widget.item.providerType == 1 ? true : false),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bigView = !bigView;
                    });
                  },
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: CarouselSlider(
                          items: [
                            if (widget.item.imagePath1 != "")
                              Image.network(
                                "$imageBaseUrl/${widget.item.imagePath1}",
                                fit: BoxFit.contain,
                                height: height * 0.28,
                                width: width,
                              ),
                            if (widget.item.imagePath2 != "")
                              Image.network(
                                "$imageBaseUrl/${widget.item.imagePath2}",
                                fit: BoxFit.contain,
                                height: height * 0.28,
                                width: width,
                              ),
                            if (widget.item.imagePath3 != "")
                              Image.network(
                                "$imageBaseUrl/${widget.item.imagePath3}",
                                fit: BoxFit.cover,
                                height: height * 0.28,
                                width: width,
                              ),
                          ],
                          options: CarouselOptions(
                            // height: 400,
                            aspectRatio: bigView ? 7 / 9 : 12 / 9,
                            viewportFraction: bigView ? 0.8 : 0.5,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
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
                              widget.item.providerType == 1
                                  ? widget.item.saloon?.nameEn ?? ""
                                  : widget.item.shop?.nameEn ?? "",
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
                            widget.item.providerType == 1
                                ? widget.item.saloon?.city?.nameEn ?? ""
                                : widget.item.shop?.city?.nameEn ?? "",
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
                        children: [
                          const Text(
                            "Discount",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),

                          Text(
                            "${widget.item.discount.toString()} %",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Expiry",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                          Text(
                            widget.item.endDate.toString(),
                            style: const TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
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
                              child: Text(
                                "Description: ${widget.item.description}",
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
                                      "Contact ${widget.item.providerType == 1 ? widget.item.saloon?.contact ?? "" : widget.item.shop?.contact ?? ""}",
                                  children: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.5,
                                        child: iconButton(
                                          onClick: () {
                                            Get.put(HelperController()).openUrl(
                                                url:
                                                    "tel:+968${widget.item.providerType == 1 ? widget.item.saloon?.contact ?? "" : widget.item.shop?.contact ?? ""}");
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
                                                    "whatsapp://send?phone=${widget.item.providerType == 1 ? widget.item.saloon?.contact ?? "" : widget.item.shop?.contact ?? ""}&text=");
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
                                latitude: widget.item.providerType == 1
                                    ? widget.item.saloon?.latitude ?? ""
                                    : widget.item.shop?.latitude ?? "",
                                longitude: widget.item.providerType == 1
                                    ? widget.item.saloon?.longitude ?? ""
                                    : widget.item.shop?.longitude ?? "",
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
          if (widget.item.providerType == 2)
            for (var i = 0; i < widget.item.shop!.products!.length; i++)
              productItem(
                cardHeight,
                context,
                product: widget.item.shop!.products![i],
              )
          else if (widget.item.providerType == 1)
            for (var i = 0; i < widget.item.saloon!.services!.length; i++)
              serviceItem(cardHeight, context,
                  service: widget.item.saloon!.services![i],
                  saloon: widget.item.saloon!,
                  cartController: cartController),
        ],
      ))),
    );
  }
}
