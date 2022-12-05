
import "package:flutter/material.dart";
import 'package:pie_chart/pie_chart.dart';



import 'home_page.dart';

class UserBillsSummary extends StatelessWidget {
   UserBillsSummary({Key? key}) : super(key: key);
  final data = <String,double>{
    'A':190,
    'B': 230,
    'C': 150,
   'D': 73,
   'E': 31,
  };

  //color list
   final colorList = <Color>[
     Colors.greenAccent,
   ];
  //Todo: the page will be an accounting of the total of all the bills a user is supposed to pay
  //Todo: it is more of an invoice and computation
  @override
  Widget build(BuildContext context)
  => Scaffold(
        appBar: AppBar(
         leading: Builder(
        builder: (context) => IconButton(
           icon: const Icon(
                Icons.arrow_back_ios,
            size: 24,
               color: Colors.white,
             ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),);
              },
            ),
          ),
         title: const Text("Summary Centre"),
         backgroundColor: Colors.blueGrey,
         centerTitle: true,
       ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                     child: PieChart(
                     dataMap: data,
                       chartType: ChartType.ring,
                       baseChartColor: Colors.grey[300]!,
                       colorList: colorList,

                     ),
                    ),
              ],
            ),
          ),
        ),
           );
 }
