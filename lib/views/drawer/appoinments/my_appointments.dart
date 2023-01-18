import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/views/drawer/appoinments/appointment_tab.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class MyAppointmentsList extends StatefulWidget {
  const MyAppointmentsList({Key? key}) : super(key: key);
  @override
  State<MyAppointmentsList> createState() => _MyAppointmentsList();
}

class _MyAppointmentsList extends State<MyAppointmentsList> {
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Pending'),
    Tab(text: 'Confirmed'),
    Tab(text: 'Completed'),
    Tab(text: 'Cancelled'),
  ];
  final List<Widget> myWidgets = <Widget>[
    const AppointmentTab(type: 0),
    const AppointmentTab(type: 1),
    const AppointmentTab(type: 2),
    const AppointmentTab(type: 3),
    const AppointmentTab(
      type: 4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final cardHeight = height * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: "My Appointments", showCart: false),
      body: SafeArea(
        child: DefaultTabController(
          length: myTabs.length,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 12,
              ),
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                backgroundColor: topTabForground,
                unselectedBackgroundColor: topTabBackground,
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: myTabs,
              ),
              Expanded(
                child: TabBarView(children: myWidgets),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
