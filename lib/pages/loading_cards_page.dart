

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class LoadCreditCard extends StatefulWidget {
  const LoadCreditCard({Key? key}) : super(key: key);

  @override
  State<LoadCreditCard> createState() => _LoadCreditCardState();
}

class _LoadCreditCardState extends State<LoadCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cards"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: CreditCardWidget(
          onCreditCardWidgetChange: (CreditCardBrand) {  },
          cvvCode: '',
          showBackView: true,
          cardNumber: '',
          expiryDate: '',
          cardHolderName: '',),
      ),

    );
  }
}
