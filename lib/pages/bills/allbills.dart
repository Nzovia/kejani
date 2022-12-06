import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kejani/widgets/button_widget.dart';

import '../../model/bills.dart';
import '../../widgets/text_widget.dart';
import '../user_bills_page.dart';

class AllBills extends StatefulWidget {
  final Bill? bill;

  const AllBills({Key? key, this.bill}) : super(key: key);

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> with TickerProviderStateMixin {

  //defining for fields
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _balanceControler = TextEditingController();

  // final _logoController = TextEditingController();
  final _paymentDateController = TextEditingController();
  final _docId = TextEditingController();


  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      //grab the current values from the doc and store them in the controllers
      _nameController.text = documentSnapshot['name'];
      _balanceControler.text = documentSnapshot['balance'];
      _amountController.text = documentSnapshot['amount'];
      _paymentDateController.text = documentSnapshot['paymentDate'];
    }
  }


  Future<void> _delete(String productId) async{
    await _reference.doc(user?.uid).collection('bills').doc(productId).delete();
  }


  //date variables
  DateTime? selectedDate;
  DateTime _date = DateTime.now();
  var billDate;

  //initializing form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //firebase initialization
  final CollectionReference _reference = FirebaseFirestore.instance.collection(
      'users');

  //circular indicator
  late AnimationController animationController;


  //disposing animated controller
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //defining textFields
    var billNameField = TextFormField(
      autofocus: false,
      controller: _nameController,
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87),

      validator: (value) {
        if (value == null || value
            .trim()
            .isEmpty) {
          return 'bill name required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 10),
          labelText: "billName",
          enabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey)),
          hintText: "Enter billName",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          )),
    );
    var billAmountField = TextFormField(
      autofocus: false,
      controller: _amountController,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87),
      validator: (value) {
        if (value == null || value
            .trim()
            .isEmpty) {
          return 'amount is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 10),
          labelText: "BillAmount",
          enabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey)),
          hintText: "Enter your billAmount",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          )),
    );
    var billbalanceFormField = TextFormField(
      autofocus: false,
      controller: _balanceControler,
      keyboardType: TextInputType.number,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87),

      validator: (value) {
        if (value == null || value
            .trim()
            .isEmpty) {
          return 'balance is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 10),
          labelText: "billBalance",
          enabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey)),
          hintText: "Enter your billBalance",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          )),
    );
    var paymentDateFormField = TextFormField(
      autofocus: false,
      controller: _paymentDateController,
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87),

      validator: (value) {
        if (value == null || value
            .trim()
            .isEmpty) {
          return 'date is required';
        }
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: 10),
          labelText: "paymentDate",
          enabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey)),
          hintText: "Enter paymentDate",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          )),
      readOnly: true,
      onTap: () {
        setState(() {
          datePicker();
        });
      },
    );

    return Scaffold(
      body: StreamBuilder(
          stream: _reference.doc(user?.uid).collection('bills').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, build) =>
                const Divider(
                  height: 1,
                  color: Colors.blueGrey,
                ),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!
                      .docs[index];

                  return Dismissible(
                      key: ValueKey(index),
                      direction: DismissDirection.startToEnd,
                      background: buildSwipeRight(),
                      secondaryBackground: buildSwipeLeft(),
                      onDismissed: (direction) {},
                      confirmDismiss: (direction) async {
                        showDialog(context: context,
                            builder: (_)
                        =>
                            AlertDialog(
                              title: const Text("WARNING", style: TextStyle(
                                  color: Colors.red)),
                              content: const Text(
                                  "Are you sure want to delete the bill"),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      //deleting data
                                      _delete(documentSnapshot.id);

                                      //show toast
                                      Fluttertoast.showToast(
                                          msg: "Bill Successfully deleted",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.red,
                                          fontSize: 12.0
                                      );
                                      Navigator.of(context).pop(true);

                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.green),
                                    ))
                              ],
                            ));//callDelete function here
                      },
                      child: InkWell(
                        onTap: () async {
                          //call update method here
                          _update(documentSnapshot);

                          await showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              context: context,
                              builder: (BuildContext context) {
                                const SizedBox(height: 5);
                                return FractionallySizedBox(
                                  heightFactor: 1.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text("Update Bill Details",
                                          style: TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.w500),),
                                        const Divider(color: Colors.blueGrey,),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10,),
                                              billNameField,
                                              const SizedBox(height: 10,),
                                              billAmountField,
                                              const SizedBox(height: 10,),
                                              billbalanceFormField,
                                              const SizedBox(height: 10,),
                                              paymentDateFormField,
                                              const SizedBox(height: 16,),
                                              MaterialButton(
                                                minWidth: double.infinity,
                                                height: 45,
                                                onPressed: () async {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    // //update takes you to the bills paid screen
                                                    final String name = _nameController
                                                        .text;
                                                    final String amount = _amountController
                                                        .text;
                                                    final String balance = _balanceControler
                                                        .text;
                                                    final String paymentDate = _paymentDateController
                                                        .text;

                                                    if (name != null) {
                                                      await _reference.doc(
                                                          user?.uid)
                                                          .collection('bills')
                                                          .doc(
                                                          documentSnapshot!.id)
                                                          .update({
                                                        'name': name,
                                                        'amount': amount,
                                                        'balance': balance,
                                                        'paymentdate': paymentDate
                                                      });

                                                      _nameController.text = '';
                                                      _amountController.text =
                                                      '';
                                                      _balanceControler.text =
                                                      '';
                                                      _paymentDateController
                                                          .text = '';
                                                    }
                                                    Fluttertoast.showToast(
                                                        msg: "Bill Successfully deleted",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        textColor: Colors.green,
                                                        fontSize: 12.0
                                                    );
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                        (context),
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                UserBills()), (
                                                        route) => false);
                                                  }
                                                },
                                                color: Colors.indigoAccent[400],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(40)),
                                                child: const Text(
                                                  "Update Bill",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: ListTile(
                            leading: const Icon(Icons.paypal_sharp),
                            title: Text(documentSnapshot['name'] + " " +
                                "BillDate" + documentSnapshot['paymentDate']),
                            subtitle:
                            Text("Unpaid Balance: KSh." +
                                documentSnapshot['amount']),

                            //show bottom sheets here. show bottom shit on tapping the button
                            trailing: ButtonWidget(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    context: context,
                                    builder: (BuildContext context) {
                                      const SizedBox(height: 10);
                                      return FractionallySizedBox(
                                        heightFactor: 0.6,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              //add swiping cards here that shows different accounts and there balances.
                                              SizedBox(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Texts(
                                                        typedText: "BillName",
                                                        textColor: Colors
                                                            .black),
                                                    const SizedBox(width: 8.0,),
                                                    Expanded(
                                                      child: TextFormField(
                                                        autofocus: false,
                                                        enabled: false,
                                                        controller: _nameController,
                                                        keyboardType: TextInputType
                                                            .text,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: Colors
                                                                .black87),
                                                        decoration: InputDecoration(
                                                            contentPadding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 10,
                                                                horizontal: 2),
                                                            labelText: "BillName",
                                                            enabledBorder: const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                            // hintText: "Enter your billAmount",
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                              const BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .blue),
                                                              borderRadius: BorderRadius
                                                                  .circular(10),
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
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Texts(
                                                        typedText: "Amount  ",
                                                        textColor: Colors
                                                            .black),
                                                    const SizedBox(width: 8.0,),
                                                    Expanded(
                                                      child: TextFormField(
                                                        autofocus: false,
                                                        enabled: false,
                                                        controller: _amountController,
                                                        keyboardType: TextInputType
                                                            .text,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: Colors
                                                                .black87),
                                                        decoration: InputDecoration(
                                                            contentPadding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 0,
                                                                horizontal: 10),
                                                            labelText: "BillAmount",
                                                            enabledBorder: const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                            // hintText: "Enter your billAmount",
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                              const BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .blue),
                                                              borderRadius: BorderRadius
                                                                  .circular(10),
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
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Texts(
                                                        typedText: "Due Date",
                                                        textColor: Colors
                                                            .black),

                                                    const SizedBox(width: 8.0,),

                                                    Expanded(
                                                      child: TextFormField(
                                                        autofocus: false,
                                                        enabled: false,
                                                        controller: _paymentDateController,
                                                        keyboardType: TextInputType
                                                            .text,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: Colors
                                                                .black87),
                                                        decoration: InputDecoration(
                                                            contentPadding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 0,
                                                                horizontal: 10),
                                                            labelText: "PaymentDate",
                                                            enabledBorder: const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                            // hintText: "Enter your billAmount",
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide:
                                                              const BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .blue),
                                                              borderRadius: BorderRadius
                                                                  .circular(10),
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
                                                        borderRadius: BorderRadius
                                                            .circular(40)),
                                                    onPressed: () {
                                                      // //update takes you to the bills paid screen
                                                      // final String name =_nameController.text;
                                                      // final String amount = _amountController.text;
                                                      // final String balance = _balanceControler.text;
                                                      // final String paymentDate = _paymentDateController.text;
                                                      //
                                                      // if(name != null){
                                                      //   await _reference.doc(user?.uid)
                                                      //       .collection('bills')
                                                      //       .doc(documentSnapshot!.id)
                                                      //       .update({'name':name,'amount':amount, 'balance':balance, 'paymentdate':paymentDate});
                                                      //
                                                      //   _nameController.text = '';
                                                      //   _amountController.text = '';
                                                      //   _balanceControler.text = '';
                                                      //   _paymentDateController.text ='';
                                                      //
                                                      //
                                                      // }

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
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }


  buildSwipeLeft() =>
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
        child: const Icon(Icons.edit),
      );

  buildSwipeRight() =>
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete),
      );

  datePicker() async {
    selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (selectedDate != null && selectedDate != _date) {
      setState(() {
        _date = selectedDate!;
        billDate = DateFormat('dd/MM/yyyy').format(_date);
        _paymentDateController.text = "${billDate.toString()}";
      });
    }
  }
}