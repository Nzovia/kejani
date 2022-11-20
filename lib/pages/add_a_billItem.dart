import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kejani/pages/user_bills_page.dart';

import '../model/bills.dart';
import '../widgets/text_widget.dart';

class AddBillItem extends StatefulWidget {
  const AddBillItem({Key? key}) : super(key: key);

  @override
  State<AddBillItem> createState() => _AddBillItemState();
}

class _AddBillItemState extends State<AddBillItem> {
  //form key
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  //firebase
  FirebaseStorage storageReference = FirebaseStorage.instance;

  //logined user
  User? user = FirebaseAuth.instance.currentUser;

  bool showSpinner = false;
  //editing controllers
  final nameController = new TextEditingController();
  final amountController = new TextEditingController();
  final balanceControler = new TextEditingController();
  final logoController = new TextEditingController();
  final priorityControler = new TextEditingController();
  final statusController = new TextEditingController();
  final paymentDateController = new TextEditingController();

  //date variables
  DateTime? selectedDate;
  DateTime _date = DateTime.now();
  var billDate;

  //drop down choices
  late Texts _priorityChoose; //Critical/High/Optional
  late Texts _statusChoose; //Paid or Pending

  List<Texts> priorityList = [
    Texts(typedText: "Critical", textColor: Colors.red),
    Texts(typedText: "High", textColor: Colors.blue),
    Texts(typedText: "Optional", textColor: Colors.green),
  ];

  List<Texts> statusList = [
    const Texts(typedText: 'Pending', textColor: Colors.red),
    const Texts(typedText: "Paid", textColor: Colors.green),
  ];
  var options = [
    'Pending',
    'Paid',
  ];
  var _currentItemSelected = "Paid";
  var Status = "Pending";

  @override
  void initState() {
    super.initState();
    _priorityChoose = priorityList[0];
    _statusChoose = statusList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Create a New bill",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Add a new bill ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: false,
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
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
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: amountController,
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintText: "Enter your billAmount",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: balanceControler,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
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
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // TextFormField(
                            //   autofocus: false,
                            //   controller: logoController,
                            //   keyboardType: TextInputType.text,
                            //   style: const TextStyle(
                            //       fontSize: 15,
                            //       fontWeight: FontWeight.w400,
                            //       color: Colors.black87),
                            //   decoration: InputDecoration(
                            //       contentPadding: const EdgeInsets.symmetric(
                            //           vertical: 0, horizontal: 10),
                            //       labelText: "logo",
                            //       enabledBorder: const OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.grey)),
                            //       hintText: "Enter your billLogo",
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: const BorderSide(
                            //             width: 1, color: Colors.blue),
                            //         borderRadius: BorderRadius.circular(10),
                            //       )),
                            // ),
                            // const SizedBox(
                            //   height: 16,
                            // ),
                            FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                      labelText: "billPriority",
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: "Enter billPriority",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<Texts>(
                                    items: priorityList
                                        .map<DropdownMenuItem<Texts>>(
                                            (Texts value) {
                                      return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value.typedText,
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ));
                                    }).toList(),
                                    isExpanded: true,
                                    isDense: true,
                                    onChanged: (Texts? newChoose) {
                                      _onDropDownItemSelected(newChoose!);
                                    },
                                    value: _priorityChoose,
                                  )),
                                );
                              },
                              // autofocus: false,
                              // controller: priorityControler,
                              // keyboardType: TextInputType.name,
                              // style: const TextStyle(
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.w400,
                              //     color: Colors.black87),
                              // decoration:
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                      labelText: "billStatus",
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: "Enter billStatus",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<Texts>(
                                    items: statusList
                                        .map<DropdownMenuItem<Texts>>(
                                            (Texts value) {
                                      return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value.typedText,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ));
                                    }).toList(),
                                    isExpanded: true,
                                    isDense: true,
                                    onChanged: (Texts? newChoose) {
                                      _onDropDownItemSelected(newChoose!);
                                    },
                                    value: _statusChoose,
                                  )),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: paymentDateController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
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
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: const Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black))),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 45,
                          onPressed: () {
                            addNewBill();
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AllBills(
                            //
                            //             )));
                          },
                          color: Colors.indigoAccent[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Add bill",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addNewBill() async {
    //calling  fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    //calling bill
    Bill bill = Bill();

    //sending these values
    bill.amount = amountController.text;
    bill.balance = balanceControler.text;
    bill.logo = logoController.text;
    bill.name = nameController.text;
    bill.priority = priorityControler.text;
    bill.status = statusController.text;
    bill.paymentDate = paymentDateController.text;

    //add firebaseFirestore
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .collection("bills")
        .add(bill.toMap());
    Fluttertoast.showToast(msg: "new bill added");
    //Todo: loading circular thing for 3 seconds and pop for sucess
    //navigating to logicScreen
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => UserBills()), (route) => false);
  }

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
        paymentDateController.text = "${billDate.toString()}";
      });
    }
  }

  void _onDropDownItemSelected(Texts newChoose) {
    setState(() {
      _priorityChoose = newChoose;
      paymentDateController.text = "${_priorityChoose.toString()}";
    });
  }
}
