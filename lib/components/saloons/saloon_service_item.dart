import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:flutter/material.dart';

Padding serviceItem(double cardHeight, BuildContext context,
    {required Service service,
    required Saloon saloon,
    required CartController cartController}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
    child: SizedBox(
        height: cardHeight,
        // width: width * 0.95,

        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Card(
            elevation: 5,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        imageBaseUrl + service.image.toString(),
                        fit: BoxFit.fill,
                        height: cardHeight,
                        width: cardHeight * 0.99,
                      ),
                    ),
                    SizedBox(
                      height: cardHeight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: screenWidth(context) * 0.65,
                              child: Text(
                                service.generalService?.nameEn.toString() ?? "",
                                style: TextStyle(
                                    fontFamily: "primary",
                                    color: titleColor,
                                    fontSize:
                                        getTextSize(context).smallItemMainText),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.65,
                              child: Text(
                                "${service.time.toString()} minutes",
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: "primary",
                                    color: secondaryTextColor,
                                    fontSize:
                                        getTextSize(context).smallItemSubText),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.65,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${service.charges} OMR",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: "primary",
                                        color: secondaryTextColor,
                                        fontSize: getTextSize(context)
                                            .smallItemSubText),
                                  ),
                                  // Icon(
                                  //   Icons.shopping_cart,
                                  //   size: 18,
                                  //   color: primaryColor,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: GestureDetector(
                    onTap: () async {
                      if (cartController.items.isNotEmpty &&
                          cartController.selectedSaloon.value.id != saloon.id) {
                        genericPopup(context,
                            title:
                                "You have added other saloon service. Are you sure you want to clear cart to add new services",
                            children: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: getTextSize(context).width * 0.3,
                                  child: button(
                                    onClick: () {
                                      Navigator.pop(context);
                                    },
                                    text: "Cancel",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: getTextSize(context).width * 0.3,
                                  child: button(
                                    onClick: () {
                                      Navigator.pop(context);
                                      cartController.emptyCart();
                                    },
                                    text: "Clear Cart",
                                  ),
                                )
                              ],
                            )).show();
                      } else {
                        cartController.addToCart(
                            CartItem(
                                imagePath: service.image ?? "",
                                productID: service.id ?? 0,
                                providerID: service.companyId ?? 0,
                                nameEn: service.generalService?.nameEn ?? "",
                                time: service.time ?? 0,
                                nameAr: service.generalService?.nameAr ?? "",
                                unitPrice:
                                    double.tryParse(service.charges!) ?? 0),
                            saloon);
                      }
                      // var contain = Get.put(SaloonsController())
                      //     .services
                      //     .where((element) =>
                      //         element.serviceAssigneeId ==
                      //         service.serviceAssigneeId)
                      //     .first
                      //     .isAddedToCart = isAdded;

                      // Get.put(
                      //     SaloonsController().services.first.isAddedToCart);
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 22,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
  );
}
