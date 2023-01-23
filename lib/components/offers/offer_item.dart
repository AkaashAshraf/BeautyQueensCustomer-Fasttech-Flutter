import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/models/offers/offers_list.dart';
import 'package:flutter/material.dart';

Widget offerItem(double cardHeight, BuildContext context,
    {required Offer item, required dynamic onPress}) {
  return GestureDetector(
    onTap: () {
      onPress(item);
    },
    child: SizedBox(
        child: Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Card(
        elevation: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                imageBaseUrl + item.imagePath1.toString(),
                fit: BoxFit.fill,
                height: screenWidth(context) * 0.27,
                width: screenWidth(context) * 0.23,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.65,
                    child: Text(
                      item.providerType == 1
                          ? item.saloon?.nameEn ?? ""
                          : item.shop?.nameEn ?? "",
                      style: TextStyle(
                          fontFamily: "primary",
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getTextSize(context).smallItemMainText),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontFamily: "primary",
                          ),
                        ),
                        Text(
                          "${item.discount.toString()} %",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: "primary",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Expiry",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontFamily: "primary",
                          ),
                        ),
                        Text(
                          item.endDate.toString(),
                          style: const TextStyle(
                            color: secondaryTextColor,
                            fontFamily: "primary",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )),
  );
}
