import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beauty_queens_ustomer/components/common/app_bar.dart';
import 'package:beauty_queens_ustomer/components/common/buttons.dart';
import 'package:beauty_queens_ustomer/components/common/dotted_line.dart';
import 'package:beauty_queens_ustomer/components/common/generic_popup.dart';
import 'package:beauty_queens_ustomer/components/common/loading_indicator.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/constants.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/cart_controller.dart';
import 'package:beauty_queens_ustomer/conrtollers/saloons_controller.dart';
import 'package:beauty_queens_ustomer/models/simple/cart.dart';
import 'package:beauty_queens_ustomer/models/simple/employee.dart';
import 'package:beauty_queens_ustomer/models/simple/saloon.dart';
import 'package:beauty_queens_ustomer/models/simple/service.dart';
import 'package:beauty_queens_ustomer/views/home/checkout.dart';
import 'package:beauty_queens_ustomer/views/saloons/employees_list_view.dart';
import 'package:beauty_queens_ustomer/views/saloons/tabs/employees_tab.dart';
import 'package:beauty_queens_ustomer/views/saloons/tabs/services_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SaloonDetailsView extends StatefulWidget {
  SaloonDetailsView({Key? key, required this.saloon}) : super(key: key);
  final Saloon saloon;

  @override
  State<SaloonDetailsView> createState() => _SaloonDetailsView();
}

class _SaloonDetailsView extends State<SaloonDetailsView> {
  // var employees;
  // var services;
  // Employee? employees;
  // List<Employee> employees = [];
  List<Service> services = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getInitializeObjects();
  }

  getInitializeObjects() async {
    final resServices =
        await controller.fetchServicesList(id: widget.saloon.id!);
    setState(() {
      // employees = resEmployees;
      services = resServices;
      loading = false;
    });
    controller.fetchEmployeesList(id: widget.saloon.id ?? 0);
  }

  SaloonsController controller = Get.put(SaloonsController());

  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: height * 0.06,
          child: cartController.items.isNotEmpty
              ? Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(const Checkout());
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(secandaryColor),
                        ),
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: width * 0.045,
                          ),
                        )),
                  ),
                )
              : Container(),
        ),
      ),
      appBar: appBar(title: widget.saloon.nameEn!),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.89,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: Image.network(
                            "$imageBaseUrl/${widget.saloon.imagePath}",
                            fit: BoxFit.cover,
                            height: height * 0.28,
                            width: width,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      widget.saloon.nameEn!,
                                      textStyle: TextStyle(
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.w500,
                                          color: titleColor),
                                      colors: [primaryColor, secandaryColor],
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              ),
                              //   Text(
                              //     widget.saloon.nameEn!,
                              //     style: TextStyle(
                              //         fontSize: width * 0.045,
                              //         fontWeight: FontWeight.w500,
                              //         color: titleColor),
                              //   ),
                              // ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    widget.saloon.cityEn!,
                                    style: const TextStyle(
                                        color: secondaryTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "08:00 AM - 08:00 PM",
                                    style: TextStyle(color: secondaryTextColor),
                                  ),

                                  Text(
                                    "Open Now",
                                    style: TextStyle(color: secondaryTextColor),
                                  ),
                                  // DefaultTextStyle(
                                  //   style: TextStyle(
                                  //       // fontSize: 15.0,

                                  //       fontWeight: FontWeight.bold,
                                  //       color: primaryColor),
                                  //   child: AnimatedTextKit(
                                  //     repeatForever: true,
                                  //     animatedTexts: [
                                  //       FadeAnimatedText('Opened'),
                                  //     ],
                                  //     onTap: () {
                                  //       print("Tap Event");
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      Get.to(const EmployeesListView());
                                    }),
                                    child: const Text(
                                      "View Employees",
                                      style: TextStyle(
                                        color: primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          size: 10,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      const Text(
                                        "4.5 / 26",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        dottedLine(thicknes: 1),
                      ],
                    ),
                  ),
                  if (loading == true) const Center(child: LoadingIndicatore()),
                  for (var i = 0; i < services.length; i++)
                    serviceItem(cardHeight, context,
                        service: services[i], saloon: widget.saloon),

                  // ListView.builder(
                  //     itemCount: widget.controller.saloonsList.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
                  //         child: SizedBox(
                  //             height: cardHeight,
                  //             // width: width * 0.95,

                  //             child: Padding(
                  //               padding: const EdgeInsets.only(left: 0, right: 0),
                  //               child: Card(
                  //                 elevation: 5,
                  //                 child: Stack(
                  //                   children: [
                  //                     Row(
                  //                       crossAxisAlignment: CrossAxisAlignment.center,
                  //                       children: [
                  //                         ClipRRect(
                  //                           borderRadius: BorderRadius.circular(5.0),
                  //                           child: Image.network(
                  //                             imageBaseUrl +
                  //                                 widget.controller.saloonsList[index]
                  //                                     .imagePath
                  //                                     .toString(),
                  //                             fit: BoxFit.fill,
                  //                             height: cardHeight,
                  //                             width: cardHeight * 0.99,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: cardHeight,
                  //                           child: Padding(
                  //                             padding: const EdgeInsets.all(8.0),
                  //                             child: Column(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.spaceAround,
                  //                               children: [
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Text(
                  //                                     widget
                  //                                             .controller
                  //                                             .saloonsList[index]
                  //                                             .nameEn ??
                  //                                         "",
                  //                                     style: TextStyle(
                  //                                         color: titleColor,
                  //                                         fontSize:
                  //                                             getTextSize(context)
                  //                                                 .smallItemMainText),
                  //                                   ),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Text(
                  //                                     "Time : 20 mins",
                  //                                     maxLines: 1,
                  //                                     style: TextStyle(
                  //                                         color: secondaryTextColor,
                  //                                         fontSize:
                  //                                             getTextSize(context)
                  //                                                 .smallItemSubText),
                  //                                   ),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width:
                  //                                       screenWidth(context) * 0.65,
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Text(
                  //                                         "Price : 2.2 OMR",
                  //                                         maxLines: 1,
                  //                                         style: TextStyle(
                  //                                             color:
                  //                                                 secondaryTextColor,
                  //                                             fontSize: getTextSize(
                  //                                                     context)
                  //                                                 .smallItemSubText),
                  //                                       ),
                  //                                       // Icon(
                  //                                       //   Icons.shopping_cart,
                  //                                       //   size: 18,
                  //                                       //   color: primaryColor,
                  //                                       // ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     Positioned(
                  //                       bottom: 5,
                  //                       right: 10,
                  //                       child: Icon(
                  //                         Icons.shopping_cart,
                  //                         size: 22,
                  //                         color: primaryColor,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )),
                  //       );
                  //     }),
                  // // ServicesTab(
                  //   saloonID: widget.saloon.id!,
                  //   services: services,
                  // ),
                  if (false)
                    SizedBox(
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(
                              child: TabBar(tabs: [
                                Tab(
                                  child: Text(
                                    "Services",
                                    style: TextStyle(color: tabTextColor),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Employees",
                                    style: TextStyle(color: tabTextColor),
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              //Add this to give height
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(children: [
                                ServicesTab(
                                  saloonID: widget.saloon.id!,
                                  services: services,
                                ),
                                // EmployeesTab(employees: employees),
                                // Column(
                                //   children: <Widget>[
                                //     for (var item in employees) // Rest of the items

                                //       SizedBox(
                                //         height: 67,
                                //         child: Text("Akash"),
                                //       )
                                //   ],
                                // )
                                // EmployeesTab(employees: employees)
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Padding serviceItem(double cardHeight, BuildContext context,
      {required Service service, required Saloon saloon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
      child: SizedBox(
          height: cardHeight,
          // width: width * 0.95,

          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          imageBaseUrl + service.assigneeImage.toString(),
                          fit: BoxFit.fill,
                          height: cardHeight,
                          width: cardHeight * 0.99,
                        ),
                      ),
                      SizedBox(
                        height: cardHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: screenWidth(context) * 0.65,
                                child: Text(
                                  service.nameEn ?? "",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontSize: getTextSize(context)
                                          .smallItemMainText),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(context) * 0.65,
                                child: Text(
                                  "${service.time.toString()} minutes",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: getTextSize(context)
                                          .smallItemSubText),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(context) * 0.65,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${service.charges} OMR",
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: getTextSize(context)
                                              .smallItemSubText),
                                    ),
                                    // Icon(
                                    //   Icons.shopping_cart,
                                    //   size: 18,
                                    //   color: primaryColor,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: GestureDetector(
                      onTap: () async {
                        if (cartController.items.isNotEmpty &&
                            cartController.selectedSaloon.value.id !=
                                saloon.id) {
                          genericPopup(context,
                              title:
                                  "You have added other saloon service. Are you sure you want to clear cart to add new services",
                              children: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: getTextSize(context).width * 0.3,
                                    child: button(
                                      onClick: () {
                                        Navigator.pop(context);
                                      },
                                      text: "Cancel",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getTextSize(context).width * 0.3,
                                    child: button(
                                      onClick: () {
                                        Navigator.pop(context);
                                        cartController.emptyCart();
                                      },
                                      text: "Clear Cart",
                                    ),
                                  )
                                ],
                              )).show();
                        } else {
                          cartController.addToCart(
                              CartItem(
                                  imagePath: service.assigneeImage ?? "",
                                  productID: service.serviceAssigneeId ?? 0,
                                  providerID: service.serviceAssigneeId ?? 0,
                                  nameEn: service.nameEn ?? "",
                                  time: service.time,
                                  nameAr: service.nameAr ?? "",
                                  unitPrice:
                                      double.tryParse(service.charges!) ?? 0),
                              saloon);
                        }
                        // var contain = Get.put(SaloonsController())
                        //     .services
                        //     .where((element) =>
                        //         element.serviceAssigneeId ==
                        //         service.serviceAssigneeId)
                        //     .first
                        //     .isAddedToCart = isAdded;

                        Get.put(
                            SaloonsController().services.first.isAddedToCart);
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 22,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
