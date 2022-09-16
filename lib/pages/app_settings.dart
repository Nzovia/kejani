import "package:flutter/material.dart";

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Settings"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
       child: const Center(
         child:Text("app settings goes here", style: TextStyle(color: Colors.black),),
       ),
    ),

  );
}
