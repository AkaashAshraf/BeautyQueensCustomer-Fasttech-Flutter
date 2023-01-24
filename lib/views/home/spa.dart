import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/spa_controller.dart';
import 'package:beauty_queens_ustomer/views/saloons/saloon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/saloons/saloon_list_item.dart';

class SPAList extends StatefulWidget {
  const SPAList({Key? key}) : super(key: key);

  @override
  State<SPAList> createState() => _SPAList();
}

class _SPAList extends State<SPAList> {
  @override
  Widget build(BuildContext context) {
    Get.put(SPAController());

    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "SPA", showCart: false),
      body: SafeArea(child: GetX<SPAController>(builder: (controller) {
        return SizedBox(
          child: ListView.builder(
              itemCount: controller.spaList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  child: SizedBox(
                      height: cardHeight,
                      // width: width * 0.95,

                      child: saloonListItem(controller.spaList[index],
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
