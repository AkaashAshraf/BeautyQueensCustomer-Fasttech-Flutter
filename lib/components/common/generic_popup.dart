import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert genericPopup(BuildContext context,
    {required String title,
    String description = "",
    DialogButton? buttons,
    required Widget children}) {
  return Alert(
    context: context,
    content: children,
    // type: AlertType.error,
    title: title,
    style: const AlertStyle(
        titleStyle:
            TextStyle(fontFamily: "primary", fontWeight: FontWeight.bold)),
    desc: description,
    buttons: [],
  );
}
