import 'package:flutter/material.dart';

import '../pages/UserProfile.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.only(left: 10, right: 10, bottom: 5);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(itemName: "Profile",
                itemIcon: Icons.person,
                onClicked: () => clickedItem(context, 0)
            ),
            buildMenuItem(itemName: "Wallet",
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
            buildMenuItem(itemName: "Help Center",
                itemIcon: Icons.help,
                onClicked: () => clickedItem(context, 2)
            ),
            buildMenuItem(itemName: "Settings",
                itemIcon: Icons.settings,
                onClicked: () => clickedItem(context, 3)
            ),
            buildMenuItem(itemName: "DarkMode",
                itemIcon: Icons.dark_mode_outlined,
                onClicked: () => clickedItem(context, 3)),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(itemName: "Update",
                itemIcon: Icons.update,
                onClicked: () => clickedItem(context, 4)
            ),
            buildMenuItem(itemName: "LogOut",
                itemIcon: Icons.logout,
                onClicked: () => clickedItem(context, 5)
            ),
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
    Navigator.of(context).pop(); // programattically close the the navigator before navigating to the next filed
    switch(i){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        //TODO: Display user details
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        //TODO: Load your  wallet activity
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        //TODO: Learn more about the app and you can contact us
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        //TODO: opening app settings activity
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        //TODO: opening playstore and get new version of the app
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
        break;

    }

  }
}


