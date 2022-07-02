import "package:flutter/material.dart";

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Column(
            children: [
              ClipOval(
                child: Image.asset("user.png"),
              ),
              const Text("Nicholas Maundu")
            ],
          )),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              //TODO: Display user details
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Wallet"),
            onTap: () {
              //TODO: Load your  wallet activity
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              //TODO: opening app settings activity
              Navigator.pop(context);
            },
          ),
          ListTile(
              title: const Text("Help Center"),
              onTap: () {
                //TODO: Learn more about the app and you can contact us
                Navigator.pop(context);
              }),
          ListTile(
            title: const Text("LogOut"),
            onTap: () {
              //TODO: Exit the application
              Navigator.pop(context);
            },
          )
        ],
      ),
    ));
  }
}
