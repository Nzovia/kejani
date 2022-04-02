import 'package:flutter/material.dart';
import 'package:kejani/widgets/cards/bill_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:const Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: BillsWidget(
              colors: Colors.blue,
              billlogo:Icons.water_drop_sharp, billsName: 'Water', date: '02/04/2022' ,

            ),
          )
    ),
    );
  }
}
