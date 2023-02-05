import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/models/simple/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding productItem(double cardHeight, BuildContext context,
    {required Product product}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
    child: SizedBox(
        // height: cardHeight,
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
                    imageBaseUrl + product.image3!,
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
                            Get.locale.toString() == "en"
                                ? product.nameEn ?? ""
                                : product.nameAr ?? "",
                            style: TextStyle(
                                fontFamily: "primary",
                                fontWeight: FontWeight.w600,
                                color: titleColor,
                                fontSize:
                                    getTextSize(context).smallItemMainText),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context) * 0.65,
                          child: Text(
                            Get.locale.toString() == "en"
                                ? product.brand?.nameEn ?? ""
                                : product.brand?.nameAr ?? "",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.price!.toStringAsFixed(3),
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: "primary",
                                    color: secondaryTextColor,
                                    fontSize:
                                        getTextSize(context).smallItemSubText),
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
          ],
        ),
      ),
    )),
  );
}
