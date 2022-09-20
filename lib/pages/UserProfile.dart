import "package:flutter/material.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () {
                //Navigator.of(context).ro;
              },
            ),
          ),
          title: const Text("Profile"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "User profile goes here",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
}
