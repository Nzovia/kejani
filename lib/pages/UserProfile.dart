import "package:flutter/material.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Profile"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
       child: const Center(
         child:Text("User profile goes here", style: TextStyle(color: Colors.black),),
       ),
    ),

  );
}
