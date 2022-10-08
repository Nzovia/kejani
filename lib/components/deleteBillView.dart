import 'package:flutter/material.dart';

class DeleteBill extends StatelessWidget {
  const DeleteBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("WARNING"),
      content: const Text("are you sure you want to delete bill"),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("YES")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("NO"))
      ],
    );
  }

  FlatButton({required Null Function() onPressed, required Text child}) {}
}
