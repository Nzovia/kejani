import "package:flutter/material.dart";

class UpdateApp extends StatelessWidget {
  const UpdateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("UpdateApp"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
       child: const Center(
         child:Text("the page is intended for update, opens min playstore", style: TextStyle(color: Colors.black),),
       ),
    ),

  );
}
