import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:flutter/material.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:get/get.dart';

class CartCardItem extends StatelessWidget {
  const CartCardItem({Key? key, required this.item}) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Card(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "$imageBaseUrl/${item.imagePath}",
                    fit: BoxFit.cover,
                    width: width * 0.2,
                    height: width * 0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        Get.locale.toString() == "en"
                            ? item.nameEn
                            : item.nameAr,
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontFamily: "primary",
                            fontWeight: FontWeight.w600,
                            color: titleColor),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        "${item.time.toString()} ${"Minutes".tr}",
                        style: TextStyle(
                            fontFamily: "primary",
                            color: secondaryTextColor,
                            fontSize: screenWidth(context) * 0.035),
                      ),
                    ),
                    if(item.unitPrice>item.discountedPrice)
                     SizedBox(
                                                                width: width * 0.7,

                                child: Text(
                                        "${item.unitPrice.toString()} OMR",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "primary",
                                        ),
                                      ),
                              ),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        "${item.discountedPrice.toStringAsFixed(3)} ${"OMR".tr}",
                        style: TextStyle(
                            fontFamily: "primary",
                            color: secondaryTextColor,
                            fontSize: screenWidth(context) * 0.035),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                Get.put(CartController()).items.removeWhere((iterativeItem) =>
                    item.productID == iterativeItem.productID);
              },
              child: const Icon(
                Icons.cancel_rounded,
                color: Colors.red,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
