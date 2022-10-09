import 'package:flutter/material.dart';
import 'package:kejani/model/bills.dart';

import '../../services/bills_service.dart';
import '../bills/allbills.dart';

class PendingBills extends StatefulWidget {
  const PendingBills({Key? key}) : super(key: key);

  @override
  State<PendingBills> createState() => _PendingBillsState();
}

class _PendingBillsState extends State<PendingBills> {
  final BillApiService api = BillApiService();
  List<Bill> billsList = [];

  @override
  void initState() {
    super.initState();
    loadList();
  }

  Future loadList() {
    Future<List<Bill>> bills = api.getBills();
    bills.then((billsList) {
      setState(() {
        this.billsList = billsList;
      });
    });
    return bills;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
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
