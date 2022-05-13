import 'package:flutter/material.dart';

import '../../widgets/cards/bill_widget.dart';
class PaidBills extends StatefulWidget {
  const PaidBills({Key? key}) : super(key: key);

  @override
  State<PaidBills> createState() => _PaidBillsState();
}

class _PaidBillsState extends State<PaidBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Container(
        child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Column(
              children: const [
                BillsWidget(
                  colors: Colors.blue,
                  billlogo: Icons.water_drop_sharp,
                  billsName: 'Water',
                  date: '02/04/2022',
                ),
                SizedBox(height: 8.0,),
                BillsWidget(
                  colors: Colors.orange,
                  billlogo: Icons.power,
                  billsName: 'Electricity',
                  date: '02/04/2022',
                ),
                BillsWidget(
                  colors: Colors.blueGrey,
                  billlogo: Icons.wifi,
                  billsName: 'Internet',
                  date: '02/04/2022',
                ),
                BillsWidget(
                  colors: Colors.green,
                  billlogo: Icons.house,
                  billsName: 'Rent',
                  date: '02/04/2022',
                ),
              ],

            )),
      ),
    );
  }
}
