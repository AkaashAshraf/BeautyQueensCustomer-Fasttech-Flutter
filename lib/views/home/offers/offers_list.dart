import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';

class OFFERSList extends StatefulWidget {
  const OFFERSList({Key? key}) : super(key: key);
  @override
  State<OFFERSList> createState() => _OFFERSList();
}

class _OFFERSList extends State<OFFERSList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Offers"),
      body: SafeArea(
        child: Center(child: Text("No data available")),
      ),
    );
  }
}
