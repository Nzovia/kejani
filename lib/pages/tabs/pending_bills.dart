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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: const AllBills()),
    );
  }
}
