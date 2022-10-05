import 'package:flutter/material.dart';
import 'package:kejani/pages/bills_summary.dart';
import 'package:kejani/pages/app_settings.dart';
import 'package:kejani/pages/creditcard.dart';
import 'package:kejani/pages/update_app.dart';
import 'package:kejani/pages/user_login.dart';

import '../pages/UserProfile.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.only(left: 10, right: 10, bottom: 0);

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = ("images/profile.png");
    const userName = "Fidelis Mueni";
    const userEmail = "fidelismueni182@gmail.com";

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            buildHeader(
                imageUrl: imageUrl,
                userName: userName,
                userEmail: userEmail,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserProfile()))),
            const SizedBox(
              height: 28,
            ),
            buildMenuItem(
                itemName: "Profile",
                itemIcon: Icons.person,
                onClicked: () => clickedItem(context, 0)),
            buildMenuItem(
                itemName: "Wallet",
                itemIcon: Icons.monetization_on,
                onClicked: () => clickedItem(context, 1)),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                itemName: "Help Center",
                itemIcon: Icons.help,
                onClicked: () => clickedItem(context, 2)),
            buildMenuItem(
                itemName: "Settings",
                itemIcon: Icons.settings,
                onClicked: () => clickedItem(context, 3)),
            // buildMenuItem(itemName: "DarkMode",
            //     itemIcon: Icons.dark_mode_outlined,
            //     onClicked: () => clickedItem(context, 3)),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                itemName: "Update",
                itemIcon: Icons.update,
                onClicked: () => clickedItem(context, 4)),
            buildMenuItem(
                itemName: "LogOut",
                itemIcon: Icons.logout,
                onClicked: () => clickedItem(context, 5)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String itemName,
    required IconData itemIcon,
    VoidCallback? onClicked,
  }) {
    const itemColor = Colors.blue;
    return ListTile(
      leading: Icon(
        itemIcon,
        color: itemColor,
      ),
      title: Text(
        itemName,
        style: const TextStyle(color: itemColor),
      ),
      onTap: onClicked,
    );
  }

  void clickedItem(BuildContext context, int i) {
    Navigator.of(context)
        .pop(); // programattically close the the navigator before navigating to the next filed
    switch (i) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const UserProfile()));
        //TODO: Display user details
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreditCards()));
        //TODO: Load your  wallet activity
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const UserBillsSummary()));
        //TODO: Learn more about the app and you can contact us
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AppSettings()));
        //TODO: opening app settings activity
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const UpdateApp()));
        //TODO: opening playstore and get new version of the app
        break;
      default:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
      // case 5:
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile()));
      //   break;

    }
  }

  buildHeader(
          {required String imageUrl,
          required String userName,
          required String userEmail,
          required Future Function() onClicked}) =>
      (InkWell(
        onTap: onClicked,

        //create an header within a row widget
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(userName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(userEmail,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300)),
                ],
              )
            ],
          ),
        ),
      ));
}
