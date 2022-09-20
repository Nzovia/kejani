import 'package:flutter/material.dart';

class AddBillItem extends StatefulWidget {
  const AddBillItem({Key? key}) : super(key: key);

  @override
  State<AddBillItem> createState() => _AddBillItemState();
}

class _AddBillItemState extends State<AddBillItem> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:Center(
          child: Text("Implement create form"),
        )
    );
  }
}
