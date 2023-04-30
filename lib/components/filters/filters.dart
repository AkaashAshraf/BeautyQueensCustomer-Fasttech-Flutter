import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert filtersPopup(
  BuildContext context, {
  required dynamic topRateChange,
  required dynamic mostRateChange,
  required dynamic nearByChange,
  required bool topRate,
  required bool mostRate,
  required bool nearBy,
}) {
  return genericPopup(context,
      title: "Filters",
      children: Filters(
          mostRate: mostRate,
          topRate: topRate,
          nearBy: nearBy,
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
  }) : super(key: key);
  dynamic topRateChange;
  dynamic mostRateChange;
  dynamic nearByChange;
  bool topRate;
  bool mostRate;
  bool nearBy;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool topRate = false;
  bool mostRate = false;
  bool nearBy = false;
  @override
  void initState() {
    setState(() {
      topRate = widget.topRate;
      mostRate = widget.mostRate;
      nearBy = widget.nearBy;
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
            const Text(
              "Near By",
              style: TextStyle(fontFamily: "primary"),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Top Rate",
              style: TextStyle(fontFamily: "primary"),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Most Rate",
              style: TextStyle(fontFamily: "primary"),
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
        )
      ],
    );
  }
}
