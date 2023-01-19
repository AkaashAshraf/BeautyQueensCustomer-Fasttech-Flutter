import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({Key? key}) : super(key: key);
  @override
  State<NotificationsList> createState() => _NotificationsList();
}

class _NotificationsList extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Notifications"),
      body: SafeArea(
        child: Center(
            child: Text(
          "No notifications available",
          style: TextStyle(
              fontFamily: "primary", fontSize: screenWidth(context) * 0.04),
        )),
      ),
    );
  }
}
