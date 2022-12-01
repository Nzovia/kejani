import "package:flutter/material.dart";

import 'home_page.dart';

class UserBillsSummary extends StatelessWidget {
  const UserBillsSummary({Key? key}) : super(key: key);
  //Todo: the page will be an accounting of the total of all the bills a user is supposed to pay
  //Todo: it is more of an invoice and computation
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),);
              },
            ),
          ),
          title: const Text("Summary Centre"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "Summary CENTER IMPLEMENTATION",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
}
