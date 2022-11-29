import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:flutter/material.dart';

class SPAList extends StatefulWidget {
  const SPAList({Key? key}) : super(key: key);
  @override
  State<SPAList> createState() => _SPAList();
}

class _SPAList extends State<SPAList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "SPA"),
      body: SafeArea(
        child: Center(child: Text("No data available")),
      ),
    );
  }
}
