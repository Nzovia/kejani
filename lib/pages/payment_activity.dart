import 'package:flutter/material.dart';
import 'package:kejani/widgets/button_widget.dart';
import 'package:kejani/widgets/text_widget.dart';

class PaymentActivity extends StatefulWidget {
  const PaymentActivity({Key? key}) : super(key: key);

  @override
  State<PaymentActivity> createState() => _PaymentActivityState();
}

class _PaymentActivityState extends State<PaymentActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Manual Payment"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              //add swiping cards here that shows different accounts and there balances.
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Texts(typedText: "BillName", textColor: Colors.black),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        //controller: amountController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "BillName",
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            // hintText: "Enter your billAmount",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Texts(
                        typedText: "Amount  ", textColor: Colors.black),
                    const SizedBox(width: 8.0,),
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        //controller: amountController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "BillAmount",
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            // hintText: "Enter your billAmount",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Texts(typedText: "Due Date", textColor: Colors.black),

                    const SizedBox(width: 8.0,),

                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        //controller: amountController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "PaymentDate",
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            // hintText: "Enter your billAmount",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),

                    //Choose cards from a row that shows all your cards

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ButtonWidget(
                    buttonText: "Pay Now",
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {
                      //takes you to the bills paid screen
                    },
                    buttonColor: Colors.green),
              )
            ],

          ),
        ),
      ),
    );
  }
}
