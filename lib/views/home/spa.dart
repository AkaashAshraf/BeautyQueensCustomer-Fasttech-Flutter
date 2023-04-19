import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/no_data_widget.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/constants_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/spa_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/city.dart';
import 'package:beauty_queens_ustomer/views/saloons/saloon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../components/saloons/saloon_list_item.dart';

class SPAList extends StatefulWidget {
  const SPAList({Key? key}) : super(key: key);

  @override
  State<SPAList> createState() => _SPAList();
}

class _SPAList extends State<SPAList> {
  City city = City();
  ConstantsController constantsController = Get.find<ConstantsController>();
  SPAController sPAController = Get.find<SPAController>();

  @override
  void initState() {
    sPAController.fetchSpaList();
    constantsController.fetchCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: "SPA".tr, showCart: false),
      body: SafeArea(child: GetX<SPAController>(builder: (controller) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownSearch<String>(
                    label: "Select City",
                    autoValidateMode: AutovalidateMode.always,
                    dropdownBuilder: ((context, item) => Text(item ?? "")),
                    showSearchBox: true,
                    showAsSuffixIcons: true,
                    showSelectedItems: true,
                    items: constantsController.cities
                        .map((element) => Get.locale.toString() == "en"
                            ? element.nameEn ?? ""
                            : element.nameAr ?? "")
                        .toList(),
                    onChanged: (value) {
                      // inspect(_controller.stores.indexWhere((element) =>
                      //     element.mobile.toString() ==
                      //     _value.toString()));

                      try {
                        City currentSelectedCity = constantsController.cities[
                            constantsController.cities.indexWhere((element) =>
                                Get.locale.toString() == "en"
                                    ? element.nameEn == value
                                    : element.nameAr == value)];
                        // inspect(currentSelectedStore);
                        setState(() {
                          city = currentSelectedCity;
                        });
                      } catch (e) {}
                    },
                    selectedItem: Get.locale.toString() == "en"
                        ? city.nameEn
                        : city.nameAr,
                  ),
                )),
            Expanded(
              child: ((city.id == 0 && controller.spaList.isNotEmpty) ||
                      (city.id != 0 &&
                          controller.spaList
                              .where((p0) => p0.city?.id == city.id)
                              .isNotEmpty))
                  ? ListView.builder(
                      itemCount: city.id == 0
                          ? controller.spaList.length
                          : controller.spaList
                              .where((p0) => p0.city?.id == city.id)
                              .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, left: 5, right: 5),
                          child: SizedBox(
                              // width: width * 0.95,

                              child: saloonListItem(
                                  city.id == 0
                                      ? controller.spaList[index]
                                      : controller.spaList
                                          .where((p0) => p0.city?.id == city.id)
                                          .toList()[index],
                                  context: context, onPress: (saloon) {
                            Get.to(SaloonDetailsView(
                              saloon: saloon,
                            ));
                          })),
                        );
                      })
                  : const NoDataWidget(text: "No Data Available"),
            )
          ],
        );
      })),
    );
  }
}
