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

    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(child: Text("No data available")),
      ),
    );
  }
}
