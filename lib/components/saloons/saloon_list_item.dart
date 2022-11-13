import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Card saloonListItem(Saloon saloon,
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
              height: cardHeight * 0.62,
              width: width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        saloon.nameEn!,
                        textStyle: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500,
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
                Row(
                  children: [
                    Text(
                      saloon.cityEn!,
                      style: const TextStyle(color: secondaryTextColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "08:00 AM - 08:00 PM",
                      style: TextStyle(color: secondaryTextColor),
                    ),
                    Text(
                      "Open Now",
                      style: TextStyle(color: secondaryTextColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 4.5,
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
                    const Text(
                      "4.5 / 26",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
