import "package:flutter/material.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Our Pages"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
       child: Center(
         child:const Text("ALL ITEMS will Have there Pages implemented", style: TextStyle(color: Colors.white),),
       ),
    ),

  );
}
