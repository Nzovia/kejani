

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class LoadCreditCard extends StatefulWidget {

  const LoadCreditCard({Key? key}) : super(key: key);

  @override
  State<LoadCreditCard> createState() => _LoadCreditCardState();
}

class _LoadCreditCardState extends State<LoadCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cards"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children:<Widget> [
            // CreditCardWidget(
            //   cardNumber: cardNumber,
            //   expiryDate: expiryDate,
            //   cardHolderName: cardHolderName,
            //   cvvCode: cvvCode,
            //   bankName: 'EQUITY Bank',
            //   showBackView: isCvvFocused,
            //   cardBgColor: Colors.redAccent,
            //   glassmorphismConfig: Glassmorphism.defaultConfig(),
            //   // backgroundImage: 'assets/card_bg.png',
            //   // backgroundNetworkImage: 'image-url',
            //  obscureCardNumber: true,
            //   obscureCardCvv: true,
            //   isHolderNameVisible: false,
            //   height: 175,
            //   textStyle: TextStyle(color: Colors.black),
            //   width: MediaQuery.of(context).size.width,
            //   isChipVisible: true,
            //   isSwipeGestureEnabled: true,
            //   animationDuration: Duration(milliseconds: 1000),
            //   customCardTypeIcons: <CustomCardTypeIcon>[
            //     CustomCardTypeIcon(
            //       cardType: CardType.mastercard,
            //       cardImage: Image.asset(
            //         'assets/images/mastercard.png',
            //         height: 48,
            //         width: 48,
            //       ),
            //     ),
            //   ], onCreditCardWidgetChange: (CreditCardBrand ) {  },
            //
            // ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'EQUITY Bank',
              showBackView: isCvvFocused,
              isChipVisible: true,
              cardBgColor: Colors.deepOrangeAccent,
              obscureCardNumber: true,
              obscureCardCvv: true,
              height: 175,
              textStyle: TextStyle(color: Colors.black),
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000), onCreditCardWidgetChange: (CreditCardBrand ) {  },
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey, // Required
                        onCreditCardModelChange: onCreditCardModelChange, // Required
                        themeColor: Colors.red,
                        obscureCvv: true,
                        obscureNumber: true,
                        isHolderNameVisible: false,
                        isCardNumberVisible: false,
                        isExpiryDateVisible: false,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ), cardNumber: '', cvvCode: '', cardHolderName: '', expiryDate: '',
                      ),
                    ],
                  ),
                ))
  ]
      )

    )
    );

}
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  }

