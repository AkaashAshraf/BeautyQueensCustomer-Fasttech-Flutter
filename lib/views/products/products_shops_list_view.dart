import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/no_data_widget.dart';
import 'package:beauty_queens_ustomer/components/filters/filters.dart';
import 'package:beauty_queens_ustomer/components/products/shops_list_item.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/constants_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/shops_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/city.dart';
import 'package:beauty_queens_ustomer/views/products/shop_details_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsListView extends StatefulWidget {
  const ShopsListView({Key? key}) : super(key: key);
  @override
  State<ShopsListView> createState() => _ShopsListView();
}

class _ShopsListView extends State<ShopsListView> {
  City city = City();
  bool topRate = false;
  bool isOpen = false;

  bool mostRate = false;
  bool nearBy = false;
  ConstantsController constantsController = Get.find<ConstantsController>();
  ShopsController shopsController = Get.find<ShopsController>();
  @override
  void initState() {
    shopsController.fetchShopsList();
    shopsController.checkLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: "BeautyProductsShops".tr, showCart: false),
      body: SafeArea(child: GetX<ShopsController>(builder: (controller) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownSearch<String>(
                    label: "SelectCity".tr,
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
                GestureDetector(
                  onTap: () {
                    // controller.findDistance();
                    // return;
                    filtersPopup(context,
                            mostRateShow: false,
                            topRateShow: false, topRateChange: () {
                      setState(() {
                        topRate = !topRate;
                      });
                      controller.sort(
                          topRate: topRate,
                          isOpen: isOpen,
                          mostRate: mostRate,
                          nearBy: nearBy);
                    }, isOpenChange: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                      controller.sort(
                          topRate: topRate,
                          mostRate: mostRate,
                          nearBy: nearBy,
                          isOpen: isOpen);
                    }, mostRateChange: () {
                      setState(() {
                        mostRate = !mostRate;
                      });
                      controller.sort(
                          topRate: topRate,
                          isOpen: isOpen,
                          mostRate: mostRate,
                          nearBy: nearBy);
                    }, nearByChange: () {
                      setState(() {
                        nearBy = !nearBy;
                      });
                      controller.sort(
                          topRate: topRate,
                          isOpen: isOpen,
                          mostRate: mostRate,
                          nearBy: nearBy);
                    },
                            topRate: topRate,
                            isOpen: isOpen,
                            mostRate: mostRate,
                            nearBy: nearBy)
                        .show();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: primaryColor,
                    size: 36.0,
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
            Expanded(
              child: ((city.id == 0 && controller.shopsList.isNotEmpty) ||
                      (city.id != 0 &&
                          controller.shopsList
                              .where((p0) => p0.city?.id == city.id)
                              .isNotEmpty))
                  ? ListView.builder(
                      itemCount: city.id == 0
                          ? controller.shopsList.length
                          : controller.shopsList
                              .where((p0) => p0.city?.id == city.id)
                              .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, left: 5, right: 5),
                          child: SizedBox(
                              // width: width * 0.95,

                              child: shopsListItem(
                                  city.id == 0
                                      ? controller.shopsList[index]
                                      : controller.shopsList
                                          .where((p0) => p0.city?.id == city.id)
                                          .toList()[index],
                                  context: context, onPress: (shop) {
                            Get.to(ShopsDetailsView(
                              shop: shop,
                            ));
                          })),
                        );
                      })
                  : const NoDataWidget(text: "No Data Available"),
            ),
          ],
        );
      })),
    );
  }
}
