import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:flutter/material.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({Key? key}) : super(key: key);
  @override
  State<AppointmentTab> createState() => _AppointmentTab();
}

class _AppointmentTab extends State<AppointmentTab> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Text(
          "No data available",
          style: TextStyle(
              fontFamily: "primary", fontSize: screenWidth(context) * 0.04),
        )),
      ),
    );
  }
}
