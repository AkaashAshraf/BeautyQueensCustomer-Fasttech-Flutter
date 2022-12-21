import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(title: "Cart"),
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: const Center(
            child: Padding(
                padding: EdgeInsets.all(8.0), child: Text("No data found")),
          ),
        ),
      ),
    );
  }
}
