import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert textAlert(BuildContext context,
    {required String title, String description = "", DialogButton? buttons}) {
  return Alert(
    context: context,
    // type: AlertType.,
    title: title,
    desc: description,
    buttons: [
      buttons ??
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
    ],
  );
}
