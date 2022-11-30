// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/credit_card_brand.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
//
// class CreditCards extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return CreditCardsState();
//   }
// }
//
// class CreditCardsState extends State<CreditCards> {
//
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   bool useGlassMorphism = false;
//   bool useBackgroundImage = false;
//   OutlineInputBorder? border;
//
//   //textEditing controllers
//   final _cardNumber = TextEditingController();
//   final _expiryDate = TextEditingController();
//   final _cardHolderName = TextEditingController();
//   final _cvvCode = TextEditingController();
//
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     border = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey.withOpacity(0.7),
//         width: 2.0,
//       ),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//           image: !useBackgroundImage
//               ? const DecorationImage(
//                   image: ExactAssetImage('assets/bg.png'),
//                   fit: BoxFit.fill,
//                 )
//               : null,
//           color: Colors.white,
//         ),
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               const SizedBox(
//                 height: 30,
//               ),
//               CreditCardWidget(
//                 glassmorphismConfig:
//                     useGlassMorphism ? Glassmorphism.defaultConfig() : null,
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 bankName: 'EQUITY Bank',
//                 showBackView: isCvvFocused,
//                 obscureCardNumber: true,
//                 obscureCardCvv: true,
//                 isHolderNameVisible: true,
//                 cardBgColor: Colors.red,
//                 backgroundImage:
//                     useBackgroundImage ? 'assets/card_bg.png' : null,
//                 isSwipeGestureEnabled: true,
//                 onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
//                 customCardTypeIcons: <CustomCardTypeIcon>[
//                   CustomCardTypeIcon(
//                     cardType: CardType.mastercard,
//                     cardImage: Image.asset(
//                       'assets/images/mastercard.png',
//                       height: 48,
//                       width: 48,
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       CreditCardForm(
//                         formKey: formKey,
//                         obscureCvv: true,
//                         obscureNumber: true,
//                         cardNumber: cardNumber,
//                         cvvCode: cvvCode,
//                         isHolderNameVisible: true,
//                         isCardNumberVisible: true,
//                         isExpiryDateVisible: true,
//                         cardHolderName: cardHolderName,
//                         expiryDate: expiryDate,
//                         themeColor: Colors.blue,
//                         textColor: Colors.black,
//
//                         cardNumberDecoration: InputDecoration(
//                           labelText: 'Number',
//                           hintText: 'XXXX XXXX XXXX XXXX',
//                           hintStyle: const TextStyle(color: Colors.black),
//                           labelStyle: const TextStyle(color: Colors.black),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                         ),
//
//                         expiryDateDecoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.black),
//                           labelStyle: const TextStyle(color: Colors.black),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                           labelText: 'Expired Date',
//                           hintText: 'XX/XX',
//                         ),
//                         cvvCodeDecoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.black),
//                           labelStyle: const TextStyle(color: Colors.black),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                           labelText: 'CVV',
//                           hintText: 'XXX',
//                         ),
//                         cardHolderDecoration: InputDecoration(
//                             hintStyle: const TextStyle(color: Colors.black),
//                             labelStyle: const TextStyle(color: Colors.black),
//                             focusedBorder: border,
//                             enabledBorder: border,
//                             labelText: 'Card Holder',
//                             hintText: 'valid card name'),
//                         onCreditCardModelChange: onCreditCardModelChange,
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           //backgroundColor: const Color(0xff1b447b),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(12),
//                           child: const Text(
//                             'Validate',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'halter',
//                               fontSize: 14,
//                               package: 'flutter_credit_card',
//                             ),
//                           ),
//                         ),
//                         onPressed: () async{
//                           if (formKey.currentState!.validate()) {
//
//                             // loading data to the database
//
//                           } else {
//                             print('invalid!');
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onCreditCardModelChange(CreditCardModel? creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel!.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:kejani/widgets/cards/user_credit_cards.dart';

import '../constants/card_type.dart';
import '../constants/utils/card_utils.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {

  @override
  void initState() {
    _cardNumber.addListener(
          () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  //dispose
  @override
  void dispose() {
    _cardNumber.dispose();
    super.dispose();
  }

    //textEditing controllers
  final _cardNumber = TextEditingController();
  final _expiryDate = TextEditingController();
  final _cardHolderName = TextEditingController();
  final _cvvCode = TextEditingController();
  final _amount = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CardType cardType = CardType.Invalid;

  @override
  Widget build(BuildContext context) {
    CardUtils cardUtils;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Cards and Transaction")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16,0),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _cardNumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(19),
                          CardNumberInputFormatter(),
                        ],
                        decoration:  InputDecoration(hintText: "Card number",
                            suffix: CardUtils.getCardIcon(cardType) //must be fixed
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          controller: _cardHolderName,
                          keyboardType: TextInputType.text,
                          decoration:
                          const InputDecoration(hintText: "Full name"),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _cvvCode,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                // Limit the input
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: const InputDecoration(hintText: "CVV"),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _expiryDate,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(5),
                                CardMonthInputFormatter(),
                              ],
                              decoration:
                              const InputDecoration(hintText: "MM/YY"),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          controller: _amount,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter(),
                          ],
                          decoration: const InputDecoration(hintText: "Budget Amount"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text("Add card"),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: const Text("delete card"),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: const Text("update card"),
                      onPressed: () {},
                    ),
                  ],
                ),
                //const Spacer(),

                 CreditCard(
                     decoration: BoxDecoration(
                         color: Colors.deepOrangeAccent.withOpacity(0.6)
                     ),
                     image: "assets/images/visaexpres.png",
                     name: "Fidelis Mueni",
                     number: "45678900",
                     vendor: const Text(
                       "EQUITY BANK",
                       textAlign: TextAlign.right,
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w800,
                           fontSize: 16
                       ),
                     )
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getCardTypeFrmNumber() {
    if (_cardNumber.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(_cardNumber.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}