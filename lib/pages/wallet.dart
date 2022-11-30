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
import 'package:kejani/services/add_card_details.dart';
import 'package:kejani/widgets/cards/user_credit_cards.dart';

import '../constants/card_type.dart';
import '../constants/utils/card_utils.dart';
import '../widgets/cards/bill_widget.dart';
import '../widgets/wallet_action_cards.dart';
import 'home_page.dart';

class WalletAndTransactionHistoryPage extends StatefulWidget {
  const WalletAndTransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<WalletAndTransactionHistoryPage> createState() => _WalletAndTransactionHistoryPageState();
}

class _WalletAndTransactionHistoryPageState extends State<WalletAndTransactionHistoryPage> {

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
      appBar: AppBar(
          leading: Builder(
            builder: (context) =>
                IconButton(
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
          title: const Text("Cards and Transaction"),
      actions: [
        PopupMenuButton(itemBuilder: (context){
          return[
            const PopupMenuItem<int>(
              value: 0,
                child: Text("create Card")),

            const PopupMenuItem<int>(
                value: 1,
                child: Text("Update Card"))

          ];
        },
        onSelected:(value){
          if(value == 0){
            //showModalBottomSheet(context: context, builder: builder)
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                context: context, builder: ( BuildContext context){

              const SizedBox(height: 5);
              return FractionallySizedBox(
                heightFactor: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Card Processing and Validation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      const Divider(color: Colors.blueGrey,),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _cardNumber,
                              autofocus: false,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                              },
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: _cardHolderName,
                                autofocus: false,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                },
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
                                    autofocus: false,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      // Limit the input
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    decoration: const InputDecoration(hintText: "CVV"),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: TextFormField(
                                    controller: _expiryDate,
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                    },
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: _amount,
                                autofocus: false,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: const Text("Add card"),
                            onPressed: () async{
                              if (formKey.currentState!.validate()){
                                var response = await CreditCardsCRUD
                                    .addCard(
                                    cardNumber: _cardNumber.text,
                                    amount: _amount.text,
                                    expiryDate: _expiryDate.text,
                                    cardHolderName: _cardHolderName.text,
                                    cvvCode: _cvvCode.text);
                                if(response.code != 200){
                                  showDialog(context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          content: Text(response.message.toString()),
                                        );
                                      });
                                }else{
                                  showDialog(context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          content: Text(response.message.toString()),
                                        );
                                      });
                                }
                              }

                            },
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
                      const Spacer(),
                    ],
                  ),
                ),
              );


            });

          }
          else if(value ==1){
            //show update dialog

          }
        }
        )
      ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16,0),
            child: Column(
              children: [

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
                 ),
                const SizedBox(height: 8,),
                //wallet actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    WalletActionButton(
                      buttonColor: Colors.grey,
                      buttonIcon: Icons.money,
                      buttonName: "Balance",
                    ),
                    SizedBox(width: 10,),
                    WalletActionButton(
                      buttonColor: Colors.blueGrey,
                      buttonIcon: Icons.download_for_offline_outlined,
                      buttonName: "Statement",
                    ),
                    SizedBox(width: 10,),
                    WalletActionButton(
                      buttonColor: Colors.indigoAccent,
                      buttonIcon: Icons.edit_note_sharp,
                      buttonName: "Budget",
                    )

                  ],
                ),

                const SizedBox(height: 8,),
                const Text("Payment History", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                const Divider(color: Colors.black,),
                //Dynamic list of all transactions
                const BillsWidget(
                  colors: Colors.grey,
                  billlogo: Icons.paypal_outlined,
                  billsName: 'Water Bill. KSH. 3000',
                  date: 'Paid: 02/04/2022',
                ),
                const BillsWidget(
                  colors: Colors.grey,
                  billlogo: Icons.paypal_outlined,
                  billsName: 'House Rent. KSH. 13000',
                  date: 'Paid: 01/11/2022',
                ),
                const BillsWidget(
                  colors: Colors.grey,
                  billlogo: Icons.paypal_outlined,
                  billsName: 'Netflix Fee. KSH. 1500',
                  date: 'Paid: 01/11/2022',
                ),
                const BillsWidget(
                  colors: Colors.grey,
                  billlogo: Icons.paypal_outlined,
                  billsName: 'House Rent. KSH. 13000',
                  date: 'Paid: 01/11/2022',
                ),

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