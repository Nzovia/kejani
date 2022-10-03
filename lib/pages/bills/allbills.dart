import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kejani/components/deleteBillView.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import '../../services/bills_service.dart';

class AllBills extends StatefulWidget {
  final String billId;
  const AllBills({Key? key, required this.billId}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  BillService get service => GetIt.instance<BillService>();
  List<AllBills> bills = [];

  //method that gets called when opening our stateful class
  @override
  void initState() {
    bills = service.getAllBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Bills"),
      ),
      body: ListView.separated(
          separatorBuilder: (_, build) => const Divider(
                height: 1,
                color: Colors.blueGrey,
              ),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(bills[index].billId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (_) => const DeleteBill());
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                  title: const Text("Hello"),
                  subtitle: const Text("billList"),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => AddBillItem()));
                  }),
            );
          },
          itemCount: 30),
    );
  }
}
