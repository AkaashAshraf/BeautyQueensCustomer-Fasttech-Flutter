import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

// ignore: must_be_immutable
class ServicesTab extends StatefulWidget {
  ServicesTab({Key? key, required this.saloonID, required this.services})
      : super(key: key);
  final controller = Get.put(SaloonsController());
  int saloonID;
  List<Service> services;

  @override
  State<ServicesTab> createState() => _ServicesTab();
}

class _ServicesTab extends State<ServicesTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.1;
    return ListView.builder(
        itemCount: widget.controller.saloonsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
            child: SizedBox(
                height: cardHeight,
                // width: width * 0.95,

                child: serviceItem(
                    service: widget.services[index], cardHeight: cardHeight)),
          );
        });
  }

  Padding serviceItem({required Service service, required double cardHeight}) {
    // print(imageBaseUrl + service.assigneeImage!);
    return Padding(
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
                    imageBaseUrl + service.generalService!.image,
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
                            widget.services[0].generalService?.nameEn ?? "",
                            style: TextStyle(
                                color: titleColor,
                                fontSize:
                                    getTextSize(context).smallItemMainText),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context) * 0.65,
                          child: Text(
                            "Time : 20 mins",
                            maxLines: 1,
                            style: TextStyle(
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
                                "Price : 2.2 OMR",
                                maxLines: 1,
                                style: TextStyle(
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
            Positioned(
              bottom: 5,
              right: 10,
              child: Icon(
                Icons.shopping_cart,
                size: 22,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
