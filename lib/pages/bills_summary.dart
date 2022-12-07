
import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';



import '../model/pie_sections_data.dart';
import '../widgets/IndicatorsWidget.dart';
import 'home_page.dart';

class UserBillsSummary extends StatefulWidget {
   UserBillsSummary({Key? key}) : super(key: key);

  @override
  State<UserBillsSummary> createState() => _UserBillsSummaryState();
}

class _UserBillsSummaryState extends State<UserBillsSummary> {
  int _touchedIndex =0;
  //Todo: the page will be an accounting of the total of all the bills a user is supposed to pay
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              // touchCallback: (pieTouchResponse) {
                              //   setState(() {
                              //     if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              //         pieTouchResponse.touchInput is FlPanEnd) {
                              //       touchedIndex = -1;
                              //     } else {
                              //       touchedIndex = pieTouchResponse.touchedSectionIndex;
                              //     }
                              //   });
                              // },
                            ),
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 0,
                            centerSpaceRadius: 20,
                            sections: getSections(_touchedIndex),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: IndicatorsWidget(),
                    ),
                  ],
                ),

                const SizedBox(height: 4.0,),
                const Text("My Summary", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                const Divider(color: Colors.black,),
                const ListTile(title: Text("BUDGET"), subtitle: Text("KSH. "), ),
                const Divider(color: Colors.black,),
                const ListTile(title: Text("BILL TOTAL"), subtitle: Text("KSH. "), ),
                const Divider(color: Colors.black,),
                const ListTile(title: Text("PAYMENTS"), subtitle: Text("KSH. "), ),
              ],
            ),
          ),
        ),
           );
}


