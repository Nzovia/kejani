import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kejani/pages/add_a_billItem.dart';
import 'package:kejani/pages/payment_activity.dart';
import 'package:kejani/widgets/button_widget.dart';
import 'package:kejani/widgets/note_delete.dart';

import '../../model/bills.dart';
import '../../services/bills_service.dart';
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
  final _nameController =  TextEditingController();
  final _amountController = TextEditingController();
  final _balanceControler = TextEditingController();
  // final _logoController = TextEditingController();
  final _paymentDateController = TextEditingController();
  final _docId = TextEditingController();


  //date variables
  DateTime? selectedDate;
  DateTime _date = DateTime.now();
  var billDate;

  //initializing form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
    //initial values
    _docId.value = TextEditingValue(text: widget.bill?.billId.toString()??"");
    _nameController.value = TextEditingValue(text: widget.bill?.name.toString()??"");
    _amountController.value = TextEditingValue(text: widget.bill?.amount.toString()??'');
    _balanceControler.value = TextEditingValue(text: widget.bill?.balance.toString()??"");
    _paymentDateController.value = TextEditingValue(text: widget.bill?.paymentDate.toString()??"");



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

    //defining textFields
    final docIdField = TextField(
        controller: _docId,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    var billNameField =TextFormField(
      autofocus: false,
      controller: _nameController,
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87),

      validator: (value){
        if(value == null || value.trim().isEmpty){
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
      validator: (value){
        if(value == null || value.trim().isEmpty){
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

      validator: (value){
        if(value == null || value.trim().isEmpty){
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

      validator: (value){
        if(value == null || value.trim().isEmpty){
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
    var updateButton = MaterialButton(
      minWidth: double.infinity,
      height: 45,
      onPressed: () async{
        if(_formKey.currentState!.validate()){
          var response = await BillsCrud.upDateBills(
              name: _nameController.text,
              amount: _amountController.text,
              balance: _balanceControler.text,
              logo: "Bill",
              paymentDate: _paymentDateController.text,
              docId: _docId.text);

          if(response.code != 200){
            showDialog(context: context, builder: (context){
              return AlertDialog(content: Text(response.message.toString()),);
            });
            Navigator.pushAndRemoveUntil((context),
                MaterialPageRoute(builder: (context) => UserBills()), (route) => false); //navigate
          }else{
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(response.message.toString()),
                  );
                });
          }
        }
      },
      color: Colors.indigoAccent[400],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
      child: const Text(
        "Update Bill",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );

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
                  // Navigator.of(context)   //Edit BillHere
                  //     .push(MaterialPageRoute(builder: (_) => AddBillItem()));
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
                            const Text("Update Bill Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            const Divider(color: Colors.blueGrey,),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  docIdField,
                                  const SizedBox(height: 10,),
                                  billNameField,
                                  const SizedBox(height: 10,),
                                  billAmountField,
                                  const SizedBox(height: 10,),
                                  billbalanceFormField,
                                  const SizedBox(height: 10,),
                                  paymentDateFormField,
                                  const SizedBox(height: 16,),
                                  updateButton
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
                    title: Text("${billsList[index].name}"+" BillDate ${billsList[index].paymentDate}"),
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
