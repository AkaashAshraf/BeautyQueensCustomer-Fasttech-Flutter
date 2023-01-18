import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/products/shops_list_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/gym_controller.dart';
import 'package:beauty_queens_ustomer/views/products/gym_details_view.dart';
import 'package:beauty_queens_ustomer/views/products/shop_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GYM extends StatefulWidget {
  const GYM({Key? key}) : super(key: key);
  @override
  State<GYM> createState() => _GYM();
}

class _GYM extends State<GYM> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "GYM Centers", showCart: false),
      body: SafeArea(child: GetX<GYMController>(builder: (controller) {
        return SizedBox(
          child: ListView.builder(
              itemCount: controller.gymCenterList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  child: SizedBox(
                      height: cardHeight,
                      // width: width * 0.95,

                      child: shopsListItem(controller.gymCenterList[index],
                          context: context, onPress: (shop) {
                        Get.to(() => GYMDetailsView(
                              shop: shop,
                            ));
                      })),
                );
              }),
        );
      })),
    );
  }
}
