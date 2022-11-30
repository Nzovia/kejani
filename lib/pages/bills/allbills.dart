import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/pages/payment_activity.dart';
import 'package:kejani/widgets/button_widget.dart';
import 'package:kejani/widgets/note_delete.dart';

import '../../model/bills.dart';
import '../../widgets/text_widget.dart';

class AllBills extends StatefulWidget {
  const AllBills({Key? key}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> with TickerProviderStateMixin {
  //list of all the bills
  List billsList = [];

  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //initializing bills
  Bill bill = Bill();

  //circular indicator
  late AnimationController animationController;

  @override
  void initState() {
    //set animated controller on init
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);

    super.initState();
    fetchBills();
  }

  //disposing animated controller
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }


  fetchBills() async {
    dynamic results = await getAllBills();
    if (results == null) {
      return Text("unable to load data");
    } else {
      setState(() {
        billsList = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, build) => const Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
        itemCount: billsList.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: ValueKey(index),
              direction: DismissDirection.startToEnd,
              background: buildSwipeRight(),
              secondaryBackground: buildSwipeLeft(),
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                showDialog(context: context, builder: (_) => BillDelete());
              },
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AddBillItem()));
                },
                child: ListTile(
                    leading: const Icon(Icons.paypal_sharp),
                    title: Text("${billsList[index].name}"),
                    subtitle:
                        Text("Unpaid Balance: KSh. ${billsList[index].amount}"),

                    //show bottom sheets here. show bottom shit on tapping the button
                    trailing: ButtonWidget(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                            context: context, builder: ( BuildContext context){

                          const SizedBox(height: 10);
                          return FractionallySizedBox(
                            heightFactor: 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //add swiping cards here that shows different accounts and there balances.
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Texts(typedText: "BillName", textColor: Colors.black),
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
                                                    vertical: 10, horizontal: 2),
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
                          );


                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const PaymentActivity()));
                      },
                      buttonText: 'Pay',
                      buttonColor: Colors.red,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
              ));
        },
      ),
    );
  }

  Future getAllBills() async {
    //read data from firebase;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('bills')
        .orderBy('name', descending: true)
        .get();

    setState(() {
      CircularProgressIndicator(
        value: animationController.value,
        color: Colors.blue,
        // backgroundColor: Colors.green,
      );
      billsList = List.from(data.docs.map((doc) => Bill.fromSnapshot(doc)));
    });
  }

  buildSwipeLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
        child: const Icon(Icons.edit),
      );

  buildSwipeRight() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete),
      );
}
