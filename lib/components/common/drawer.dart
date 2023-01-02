import 'package:beauty_queens_ustomer/components/common/text_alert.dart';
import 'package:beauty_queens_ustomer/components/common/toasts.dart';
import 'package:beauty_queens_ustomer/config/colors.dart';
import 'package:beauty_queens_ustomer/config/storages.dart';
import 'package:beauty_queens_ustomer/config/text_sizes.dart';
import 'package:beauty_queens_ustomer/conrtollers/auth_controller.dart';
import 'package:beauty_queens_ustomer/main.dart';
import 'package:beauty_queens_ustomer/views/auth/choose_auth.dart';
import 'package:beauty_queens_ustomer/views/drawer/appoinments/my_appointments.dart';
import 'package:beauty_queens_ustomer/views/drawer/notifications/notifications.dart';
import 'package:beauty_queens_ustomer/views/drawer/profile/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Get.put(AuthController());
    return Drawer(
      child: GetX<AuthController>(builder: (controller) {
        return ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image(
                      height: height * 0.125,
                      fit: BoxFit.contain,
                      // opacity: AlwaysStoppedAnimation<double>(0.4),
                      image: const AssetImage(
                        'assets/images/logo.jpeg',
                      )),
                  SizedBox(
                      width: width * 0.8,
                      child: Text(
                        controller.userInfo.value.name.toString(),
                        style: TextStyle(
                            color: primaryColor,
                            fontFamily: "primary",
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth(context) * 0.05),
                      )),
                ],
              ),
            ),
            drawerItem(context, onPress: () {
              Get.to(const Profile());
            }, title: "Profile"),
            drawerItem(context, onPress: () {
              Get.to(const MyAppointmentsList());
            }, title: "My Appointments"),
            drawerItem(context, onPress: () {
              Get.to(const NotificationsList());
            }, title: "Notifications"),
            if (false)
              ListTile(
                leading: const Icon(
                  Icons.password,
                  size: 25,
                  color: textInputIconColor,
                ),
                title: const Text('Change Password'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            drawerItem(context, onPress: () {
              textAlert(context,
                  title: "Are you sure you want to logout?",
                  buttons: DialogButton(
                      onPressed: (() {
                        MyApp().storage.write(tokenPath, "");
                        MyApp().storage.write(userIDPath, "");
                        MyApp().storage.write(userNamePath, "");
                        MyApp().storage.write(userDataPath, "");
                        Get.offAll(const ChooseAuth(title: ""));
                      }),
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      ))).show();
            }, title: "Logout"),
            drawerItem(context, onPress: () {
              ToastMessages.showWarning("Will available soon");
            }, title: 'Change Language to   عربى'),
          ],
        );
      }),
    );
  }

  ListTile drawerItem(BuildContext context,
      {required dynamic onPress, required String title}) {
    return ListTile(
        leading: const Icon(
          Icons.my_library_books_outlined,
          size: 25,
          color: textInputIconColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: "primary",
              fontWeight: FontWeight.w600,
              fontSize: screenWidth(context) * 0.045),
        ),
        onTap: onPress);
  }
}
