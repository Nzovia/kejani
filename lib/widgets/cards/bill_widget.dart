import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejani/widgets/text_widget.dart';
import '../button_widget.dart';

class BillsWidget extends StatelessWidget {
  final String billsName, date;
  final Color colors;
  final IconData? billlogo;

  const BillsWidget(
      {Key? key,
      required this.billsName,
      required this.date,
      required this.billlogo,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              child: Card(
                elevation: 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: colors),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: Icon(billlogo, size: 18, color: colors),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Texts(typedText: billsName, textColor: Colors.black),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Texts(typedText: date, textColor: Colors.black),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    ButtonWidget(
                      buttonText: 'Paid',
                      buttonColor: Colors.blue,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ))),
    );
  }
}
