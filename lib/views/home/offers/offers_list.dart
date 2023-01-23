import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/offers/offer_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/offers_controller.dart';
import 'package:beauty_queens_ustomer/views/home/offers/offer_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatefulWidget {
  const OffersView({Key? key}) : super(key: key);
  @override
  State<OffersView> createState() => _OffersView();
}

class _OffersView extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Offers", showCart: false),
      body: SafeArea(child: GetX<OffersController>(builder: (controller) {
        return SizedBox(
          child: ListView.builder(
              itemCount: controller.offersList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                    child: SizedBox(
                      // height: cardHeight,
                      // width: width * 0.95,

                      child: offerItem(
                        100,
                        context,
                        item: controller.offersList[index],
                        onPress: (item) {
                          Get.to(OfferDetailsView(item: item));
                        },
                      ),
                    ));
              }),
        );
      })),
    );
  }
}
