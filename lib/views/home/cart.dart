import 'package:beauty_queens_ustomer/components/cart/cart_item.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/views/home/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    cartController.fetchEmployees(cartController.selectedSaloon.value.id ?? 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    final cardHeight = height * 0.12;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: appBar(title: "Cart".tr, showCart: false),
        body: SafeArea(child: GetX<CartController>(builder: (controller) {
          return Stack(
            children: [
              SizedBox(
                  child: controller.items.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 5, right: 5),
                              child: SizedBox(
                                  // height: cardHeight,
                                  // width: width * 0.95,

                                  child: CartCardItem(
                                    item: controller.items[index],
                                  )),
                            );
                          })
                      : Center(child: Text("CartIsEmpty".tr))),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Card(
                    elevation: 4,
                    // decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //       color: Colors.white,
                    //     ),
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: width * 0.5,
                                child: Text(
                                  "x${controller.items.length.toString()}",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                                const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                                                width: width * 0.5,

                                child: Text(
                                        "${controller.totalPrice.toString()} OMR",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "primary",
                                        ),
                                      ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: width * 0.5,
                                child: Text(
                                    "${controller.totalPriceAfterDiscount.toStringAsFixed(3)} ${"OMR".tr}",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.selectedEmployee.value = 0;
                              Get.to(const Checkout());
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secandaryColor),
                            ),
                            child: Text("Checkout".tr),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        })));
  }
}
