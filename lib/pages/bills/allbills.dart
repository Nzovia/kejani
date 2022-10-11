import 'package:flutter/material.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/widgets/button_widget.dart';

import '../../model/bills.dart';
import '../../services/bills_service.dart';

class AllBills extends StatefulWidget {
  // final String billId;
  final List<Bill> bills;

  const AllBills({Key? key, required this.bills}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  get bills => null;
  // final BillApiService api = BillApiService();
  late List<Bill> billsList;

  @override
  Widget build(BuildContext context) {
    if (billsList == null) {
      billsList = <Bill>[];
    }
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
                title: Text(bills[index].billName),
                subtitle: Text(bills[index].billAmount),
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
        itemCount: bills == null ? 0 : bills.length,
      ),
    );
  }
}
