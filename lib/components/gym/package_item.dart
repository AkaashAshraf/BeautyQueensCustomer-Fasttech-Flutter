import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/models/shops/shops_listing.dart';
import 'package:flutter/material.dart';

Padding packageItem(double cardHeight, BuildContext context,
    {required GymPackage item}) {
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
                        imageBaseUrl + item.image.toString(),
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
                                item.nameEn.toString(),
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
                                item.description.toString(),
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
                                    "${item.price?.toStringAsFixed(3)} OMR",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: "primary",
                                        color: secondaryTextColor,
                                        fontSize: getTextSize(context)
                                            .smallItemSubText),
                                  ),
                                  Text(
                                    "${item.duration.toString()} Months",
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
              ],
            ),
          ),
        )),
  );
}
