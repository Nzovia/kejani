import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/pages/payment_activity.dart';
import 'package:kejani/widgets/button_widget.dart';
import 'package:kejani/widgets/note_delete.dart';

import '../../model/bills.dart';

class AllBills extends StatefulWidget {
  const AllBills({Key? key}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  //list of all the bills
  List billsList = [];

  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //initializing bills
  Bill bill = Bill();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBills();
  }

  fetchBills() async {
    dynamic results = await getAllBills();
    if (results == null) {
      return Text("unable to load data");
    } else {
      setState(() {
        billsList = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, build) => const Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
        itemCount: billsList.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: ValueKey(index),
              direction: DismissDirection.startToEnd,
              background: buildSwipeRight(),
              secondaryBackground: buildSwipeLeft(),
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                showDialog(context: context, builder: (_) => BillDelete());
              },
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AddBillItem()));
                },
                child: ListTile(
                    leading: const Icon(Icons.paypal_sharp),
                    title: Text("${billsList[index].name}"),
                    subtitle:
                        Text("Unpaid Balance: KSh. ${billsList[index].amount}"),
                    trailing: ButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentActivity()));
                      },
                      buttonText: 'Pay',
                      buttonColor: Colors.red,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
              ));
        },
      ),
    );
  }

  Future getAllBills() async {
    //read data from firebase;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('bills')
        .orderBy('name', descending: true)
        .get();

    setState(() {
      billsList = List.from(data.docs.map((doc) => Bill.fromSnapshot(doc)));
    });
  }

  buildSwipeLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
        child: const Icon(Icons.edit),
      );

  buildSwipeRight() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete),
      );
}
