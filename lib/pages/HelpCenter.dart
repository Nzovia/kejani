import "package:flutter/material.dart";

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Help Centre"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Container(
      color: Colors.white,
       child: const Center(
         child:Text("HELP CENTER IMPLEMENTATION", style: TextStyle(color: Colors.black),),
       ),
    ),

  );
}
