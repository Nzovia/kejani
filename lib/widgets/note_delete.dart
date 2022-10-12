import 'package:flutter/material.dart';

class BillDelete extends StatelessWidget {
  const BillDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("WARNING", style: TextStyle(color: Colors.red)),
      content: const Text("Are you sure want to delete the bill"),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            )),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }
}
