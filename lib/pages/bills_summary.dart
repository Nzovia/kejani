import "package:flutter/material.dart";
import 'package:charts_flutter/flutter.dart' as charts;

import '../model/summary_data.dart';


class UserBillsSummary extends StatelessWidget {
  const UserBillsSummary({Key? key}) : super(key: key);
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
                Navigator.pop(context);
              },
            ),
          ),
         title: const Text("Summary Centre"),
         backgroundColor: Colors.blueGrey,
         centerTitle: true,
       ),
        body: Container(
          color: Colors.white,
          child: Expanded(
                child: charts.PieChart(
                  _getSeriesData(),
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                      arcWidth: 60,
                      arcRendererDecorators: [charts.ArcLabelDecorator()]
                  ),
                ),
              )
          ),
           );
  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}: ${row.numberOfStudents}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.numberOfStudents
      )
    ];
    return series;
  }
 }
