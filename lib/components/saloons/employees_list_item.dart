import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Card employeesListItem(Saloon saloon,
    {required dynamic onPress, required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  final cardHeight = height * 0.3;
  return Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 5,
    child: GestureDetector(
      onTap: () => {onPress(saloon)},
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "$imageBaseUrl/${saloon.imagePath}",
              fit: BoxFit.cover,
              height: width * 0.33,
              width: width,
            ),
          ),
          SizedBox(
            height: width * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      saloon.nameEn.toString(),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: getTextSize(context).twoColumnGridMainText,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Philipines",
                        style: TextStyle(
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secondaryTextColor),
                      ),
                      Text(
                        "4 years",
                        style: TextStyle(
                            fontSize: getTextSize(context).twoColumnGridSubText,
                            fontWeight: FontWeight.w500,
                            color: secandaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
