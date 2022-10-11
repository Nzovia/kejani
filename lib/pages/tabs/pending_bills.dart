import 'package:flutter/material.dart';
import 'package:kejani/model/bills.dart';

import '../bills/allbills.dart';

class PendingBills extends StatefulWidget {
  const PendingBills({Key? key}) : super(key: key);

  @override
  State<PendingBills> createState() => _PendingBillsState();
}

class _PendingBillsState extends State<PendingBills> {
  List<Bill> billsList = [];

  @override
  void initState() {
    super.initState();
  }

  // Future loadList() {
  //   Future<List<Bill>> bills;
  //   bills.then((billsList) {
  //     setState(() {
  //       this.billsList = billsList;
  //     });
  //   });
  //   return bills;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(builder: (context, snapshot) {
          return billsList.isNotEmpty
              ? AllBills(bills: billsList)
              : Center(
                  child: Text('error: unable to load data',
                      style: Theme.of(context).textTheme.headline6));
        }),
      ),
    );
  }
}
