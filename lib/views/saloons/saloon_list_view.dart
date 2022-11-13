import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/views/saloons/saloon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/saloons/saloon_list_item.dart';

class SaloonsListView extends StatefulWidget {
  const SaloonsListView({Key? key}) : super(key: key);

  @override
  State<SaloonsListView> createState() => _SaloonsListView();
}

class _SaloonsListView extends State<SaloonsListView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Beauty Centers"),
      body: SafeArea(child: GetX<SaloonsController>(builder: (controller) {
        return SizedBox(
          child: ListView.builder(
              itemCount: controller.saloonsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  child: SizedBox(
                      height: cardHeight,
                      // width: width * 0.95,

                      child: saloonListItem(controller.saloonsList[index],
                          context: context, onPress: (saloon) {
                        Get.to(SaloonDetailsView(
                          saloon: saloon,
                        ));
                      })),
                );
              }),
        );
      })),
    );
  }
}
