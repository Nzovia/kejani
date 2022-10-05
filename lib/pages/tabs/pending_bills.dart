import 'package:flutter/material.dart';
import 'package:kejani/model/bills.dart';
import '../../services/bills_service.dart';
import '../../widgets/cards/bill_widget.dart';
import '../bills/allbills.dart';

class PendingBills extends StatefulWidget {
  const PendingBills({Key? key}) : super(key: key);

  @override
  State<PendingBills> createState() => _PendingBillsState();
}

class _PendingBillsState extends State<PendingBills> {
  final BillApiService api = BillApiService();
  late List<Bill> billsList;

  @override
  Widget build(BuildContext context) {
    if (billsList == null) {
      billsList = <Bill>[];
    }
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return billsList.isNotEmpty
                  ? AllBills(bills: billsList)
                  : Center(
                      child: Text('No data found,',
                          style: Theme.of(context).textTheme.headline6));
            }),
      ),
    );
  }

  Future loadList() {
    Future<List<Bill>> futureCases = api.getBills();
    futureCases.then((billsList) {
      setState(() {
        this.billsList = billsList;
      });
    });
    return futureCases;
  }
}
