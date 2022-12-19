import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Container dashboardItem(double height, double width,
    {required dynamic onTap, required String imgName, required String title}) {
  return Container(
    height: width * 0.4,
    width: width * 0.35,
    child: Animate(
      effects: const [
        FadeEffect(delay: Duration(milliseconds: 400)),
        ScaleEffect(curve: Curves.linear, delay: Duration(milliseconds: 400))
      ],
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6,
                  color: dashboardItemBorderColor,
                ),
                shape: BoxShape.circle,
              ),
              height: width * 0.33,
              width: width * 0.33,
              child: ClipOval(
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/$imgName'))
                  //  CachedNetworkImage(
                  //   fit: BoxFit.cover,
                  //   imageUrl: "$imageBaseUrl/Assets/$imgName",
                  //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //       CircularProgressIndicator(
                  //           value: downloadProgress.progress),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontSize: width * 0.035,
                    color: dashboardTextColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
