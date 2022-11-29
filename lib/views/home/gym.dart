import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';

class GYM extends StatefulWidget {
  const GYM({Key? key}) : super(key: key);
  @override
  State<GYM> createState() => _GYM();
}

class _GYM extends State<GYM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Ladies Gym"),
      body: SafeArea(
        child: Center(child: Text("No data available")),
      ),
    );
  }
}
