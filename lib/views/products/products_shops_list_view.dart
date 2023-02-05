import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/products/shops_list_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/views/products/shop_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsListView extends StatefulWidget {
  const ShopsListView({Key? key}) : super(key: key);
  @override
  State<ShopsListView> createState() => _ShopsListView();
}

class _ShopsListView extends State<ShopsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "BeautyProductsShops".tr, showCart: false),
      body: SafeArea(child: GetX<ShopsController>(builder: (controller) {
        return SizedBox(
          child: ListView.builder(
              itemCount: controller.shopsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  child: SizedBox(
                      child: shopsListItem(controller.shopsList[index],
                          context: context, onPress: (shop) {
                    Get.to(() => ShopsDetailsView(
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
