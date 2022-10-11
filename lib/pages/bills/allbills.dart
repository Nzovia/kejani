import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/widgets/button_widget.dart';

import '../../model/bills.dart';

class AllBills extends StatefulWidget {
  const AllBills({Key? key}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  //list of all the bills
  List<Object> _billsList = [];
  //firebase
  final billsDocument = FirebaseFirestore.instance.collection('bills');

  //initializing bills
  Bill bill = Bill();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getAllBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("List of Bills"),
      // ),
      body: ListView.separated(
        separatorBuilder: (_, build) => const Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
        itemBuilder: (_, index) {
          // return Dismissible(
          //   key: ValueKey(bills[index].billId),
          //   direction: DismissDirection.startToEnd,
          //   onDismissed: (direction) {},
          //   confirmDismiss: (direction) async {
          //     final result = await showDialog(
          //         context: context, builder: (_) => const DeleteBill());
          //     return result;
          //   },
          //   background: Container(
          //     color: Colors.red,
          //     padding: const EdgeInsets.only(left: 16),
          //     child: const Align(
          //       child: Icon(
          //         Icons.delete,
          //         color: Colors.white,
          //       ),
          //       alignment: Alignment.centerLeft,
          //     ),
          //   ),
          //   child: ListTile(
          //       title: const Text("Hello"),
          //       subtitle: const Text("billList"),
          //       onTap: () {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (_) => AddBillItem()));
          //       }),
          // );
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddBillItem()));
            },
            child: ListTile(
                leading: Icon(Icons.paypal_sharp),
                title: Text("${bill.name}"),
                subtitle: Text("${bill.amount}"),
                trailing: ButtonWidget(
                  onPressed: () {},
                  buttonText: 'Pay',
                  buttonColor: Colors.red,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ));
        },
        itemCount: _billsList.length,
        // itemCount: bills == null ? 0 : bills.length,
      ),
    );
  }

  Future getAllBills() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    //read data from firebase;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bills')
        .get();

    setState(() {
      _billsList = List.from(data.docs.map((doc) => Bill.fromMap(doc)));
    });
  }
}
