import 'package:flutter/material.dart';
import '../../widgets/cards/bill_widget.dart';

class PendingBills extends StatefulWidget {
  const PendingBills({Key? key}) : super(key: key);

  @override
  State<PendingBills> createState() => _PendingBillsState();
}

class _PendingBillsState extends State<PendingBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
         child: Text("Lipa bills"),
        ));
  }
}
