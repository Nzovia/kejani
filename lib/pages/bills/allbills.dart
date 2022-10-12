import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //initializing bills
  Bill bill = Bill();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchBills();
  // }
  //
  // fetchBills() async {
  //   dynamic results = await getAllBills();
  //   if (results == null) {
  //     return Text("unable to load data");
  //   } else {
  //     setState(() {
  //       _billsList = results;
  //     });
  //   }
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getAllBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, build) => const Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
        itemCount: _billsList.length,
        itemBuilder: (context, index) {
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
      _billsList = List.from(data.docs.map((doc) => Bill.fromSnapshot(doc)));
    });
    return data;
  }
  // Future getBillsList() async {
  //   List billList = [];
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('bills')
  //         .get()
  //         .then((querySnapshot) {
  //       querySnapshot.docs.forEach((element) {
  //         billList.add(element.data());
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
