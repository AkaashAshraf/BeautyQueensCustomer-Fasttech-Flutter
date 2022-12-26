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
                            fontSize: getTextSize(context).itemMainText),
                      )),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.my_library_books_outlined,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Profile'),
              onTap: () {
                Get.to(const Profile());

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.my_library_books_outlined,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('My Appointments'),
              onTap: () {
                Get.to(const MyAppointmentsList());

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notification_important,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Notifications'),
              onTap: () {
                Get.to(const NotificationsList());

                // Update the state of the app.
                // ...
              },
            ),
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
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Logout'),
              onTap: () {
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

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
                size: 25,
                color: textInputIconColor,
              ),
              title: const Text('Change Language to   عربى'),
              onTap: () {
                ToastMessages.showWarning("Will available soon");
                // Update the state of the app.
                // ...
              },
            ),
          ],
        );
      }),
    );
  }
}
