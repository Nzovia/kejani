// ignore_for_file: avoid_print

//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/bills.dart';
import '../services/bills_service.dart';

class BillDelete extends StatefulWidget {
  const BillDelete({Key? key}) : super(key: key);

  @override
  State<BillDelete> createState() => _BillDeleteState();
}

class _BillDeleteState extends State<BillDelete> {
  //list of all the bills
  List billsList = [];

  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //initializing bills
  Bill bill = Bill();

  @override
  Widget build(BuildContext context) {
    //current user
    User? user = FirebaseAuth.instance.currentUser;
    return AlertDialog(
      title: const Text("WARNING", style: TextStyle(color: Colors.red)),
      content: const Text("Are you sure want to delete the bill"),
      actions: [
        TextButton(
            onPressed: () async {

              //deleting data
              // var response = await BillsCrud.deleteBill(docId: e.),
              // Navigator.of(context).pop(true);

            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }

}
