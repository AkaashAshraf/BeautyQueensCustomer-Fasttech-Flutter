import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/common/search_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert addAppointmentPopup(BuildContext context,
    {required String title,
    String description = "",
    DialogButton? buttons,
    required Column children}) {
  return genericPopup(context,
      title: title,
      children: Column(
        children: [
          // searchDropDown(context,
          //     value: "Akash", list: ["Akash", "Ali", "Abubakar"]),
        ],
      ));
}
