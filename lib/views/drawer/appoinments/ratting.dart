import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/ratting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RattingView extends StatefulWidget {
  const RattingView({Key? key, required this.appointmenID}) : super(key: key);
  final int appointmenID;

  @override
  State<RattingView> createState() => _RattingView();
}

class _RattingView extends State<RattingView> {
  double employeeRatting = 5;
  double saloonRatting = 5;
  double productRatting = 5;
  var controller = Get.put(RattingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Ratting".tr,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: primaryColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(child: GetX<RattingController>(builder: (controller) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "RateSaloon".tr,
              style: TextStyle(
                  fontFamily: "primary", fontSize: screenWidth(context) * 0.05),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: saloonRatting,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: secandaryColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    saloonRatting = rating;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "RateEmployee".tr,
              style: TextStyle(
                  fontFamily: "primary", fontSize: screenWidth(context) * 0.05),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: employeeRatting,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: secandaryColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    employeeRatting = rating;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "RateProducts".tr,
              style: TextStyle(
                  fontFamily: "primary", fontSize: screenWidth(context) * 0.05),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: productRatting,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: secandaryColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    productRatting = rating;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            if (!controller.loading.value)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: button(
                    text: "Submit".tr,
                    onClick: () {
                      controller.rateNow(
                          appointmentID: widget.appointmenID.toString(),
                          saloonRatting: saloonRatting.toString(),
                          employeeRatting: employeeRatting.toString(),
                          productRatting: productRatting.toString());
                    }),
              )
            else
              const Center(child: LoadingIndicatore())
          ],
        );
      })),
    );
  }
}
