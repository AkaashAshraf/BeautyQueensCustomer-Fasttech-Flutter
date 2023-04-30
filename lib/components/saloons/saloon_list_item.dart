import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/helper_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

Card saloonListItem(Saloon saloon,
    {required dynamic onPress, required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  HelperController helperController = Get.find<HelperController>();

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
              height: cardHeight * 0.58,
              width: width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Align(
                  alignment: Get.locale.toString() == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        Get.locale.toString() == "en"
                            ? saloon.nameEn ?? ""
                            : saloon.nameAr ?? "",
                        textStyle: TextStyle(
                            fontFamily: "primary",
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                            color: titleColor),
                        colors: [primaryColor, secandaryColor],
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                  //  Text(
                  //   saloon.nameEn!,
                  //   style: TextStyle(
                  //       fontSize: width * 0.045,
                  //       fontWeight: FontWeight.w500,
                  //       color: titleColor),
                  // ),
                ),
                SizedBox(
                  width: screenWidth(context) * 0.9,
                  child: Text(
                    Get.locale.toString() == "en"
                        ? saloon.cityEn ?? ""
                        : saloon.cityAr ?? "",
                    textDirection: Get.locale.toString() == "en"
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    style: const TextStyle(
                        color: secondaryTextColor, fontFamily: "primary"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: Get.locale.toString() == "en"
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${saloon.openTime1}-${saloon.closeTime1}",
                          style: const TextStyle(
                              color: secondaryTextColor, fontFamily: "primary"),
                        ),
                        Text(
                          "${saloon.openTime2}-${saloon.closeTime2}",
                          style: const TextStyle(
                              color: secondaryTextColor, fontFamily: "primary"),
                        ),
                      ],
                    ),
                    helperController.isProviderOpen(
                        open1: saloon.openTime1 ?? "",
                        open2: saloon.openTime2 ?? "",
                        close1: saloon.closeTime1 ?? "",
                        close2: saloon.closeTime2 ?? "")
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: saloon.stars == 0
                          ? 0
                          : ((saloon.stars) / (saloon.ratters)),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      "${(saloon.stars == 0 ? 0 : saloon.stars / saloon.ratters)}/${saloon.ratters}",
                      style:
                          const TextStyle(fontSize: 10, fontFamily: "primary"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
