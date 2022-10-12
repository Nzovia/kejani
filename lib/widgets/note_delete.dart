import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BillDelete extends StatelessWidget {
  const BillDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //current user
    User? user = FirebaseAuth.instance.currentUser;
    return AlertDialog(
      title: const Text("WARNING", style: TextStyle(color: Colors.red)),
      content: const Text("Are you sure want to delete the bill"),
      actions: [
        FlatButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .collection('bills')
                  .doc('billId')
                  .delete();
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            )),
        FlatButton(
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
