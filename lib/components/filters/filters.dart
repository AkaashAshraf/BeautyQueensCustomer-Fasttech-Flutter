import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert filtersPopup(BuildContext context,
    {required dynamic topRateChange,
    required dynamic mostRateChange,
    required dynamic nearByChange,
    required dynamic isOpenChange,
    required bool topRate,
    required bool mostRate,
    required bool nearBy,
    required bool isOpen,
    bool mostRateShow = true,
    bool topRateShow = true}) {
  return genericPopup(context,
      title: "Filters".tr,
      children: Filters(
          isOpen: isOpen,
          isOpenChange: isOpenChange,
          mostRate: mostRate,
          topRate: topRate,
          nearBy: nearBy,
          mostRateShow: mostRateShow,
          topRateShow: topRateShow,
          topRateChange: topRateChange,
          mostRateChange: mostRateChange,
          nearByChange: nearByChange));
}

class Filters extends StatefulWidget {
  Filters({
    Key? key,
    required this.mostRate,
    required this.topRate,
    required this.nearBy,
    required this.topRateChange,
    required this.mostRateChange,
    required this.nearByChange,
    required this.mostRateShow,
    required this.topRateShow,
    required this.isOpenChange,
    required this.isOpen,
  }) : super(key: key);
  dynamic topRateChange;
  dynamic mostRateChange;
  dynamic nearByChange;
  dynamic isOpenChange;

  bool topRate;
  bool isOpen;

  bool mostRate;
  bool nearBy;
  bool mostRateShow;
  bool topRateShow;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool topRate = false;
  bool mostRate = false;
  bool isOpen = false;

  bool nearBy = false;
  @override
  void initState() {
    setState(() {
      topRate = widget.topRate;
      mostRate = widget.mostRate;
      nearBy = widget.nearBy;
      isOpen = widget.isOpen;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: primaryColor,
                  // size: 30.0,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "NearBy".tr,
                  style: const TextStyle(fontFamily: "primary"),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth(context) * 0.2,
              child: CheckboxListTile(
                value: nearBy,
                onChanged: (newValue) {
                  widget.nearByChange();
                  setState(() {
                    nearBy = !nearBy;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ],
        ),
        if (widget.topRateShow)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "TopRate".tr,
              //   style: const TextStyle(fontFamily: "primary"),
              // ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: primaryColor,
                    // size: 30.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "TopRate".tr,
                    style: const TextStyle(fontFamily: "primary"),
                  ),
                ],
              ),

              SizedBox(
                width: screenWidth(context) * 0.2,
                child: CheckboxListTile(
                  value: topRate,
                  onChanged: (newValue) {
                    widget.topRateChange();
                    setState(() {
                      topRate = !topRate;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
            ],
          ),
        if (widget.mostRateShow)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.motion_photos_auto,
                    color: primaryColor,
                    // size: 30.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "MostRate".tr,
                    style: const TextStyle(fontFamily: "primary"),
                  ),
                ],
              ),
              SizedBox(
                width: screenWidth(context) * 0.2,
                child: CheckboxListTile(
                  value: mostRate,
                  onChanged: (newValue) {
                    widget.mostRateChange();
                    setState(() {
                      mostRate = !mostRate;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.shop,
                  color: primaryColor,
                  // size: 30.0,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Opened".tr,
                  style: const TextStyle(fontFamily: "primary"),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth(context) * 0.2,
              child: CheckboxListTile(
                value: isOpen,
                onChanged: (newValue) {
                  widget.isOpenChange();
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ],
        )
      ],
    );
  }
}
