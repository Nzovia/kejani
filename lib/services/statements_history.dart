import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/cards/bill_widget.dart';

class StatementsHistory extends StatefulWidget {
  const StatementsHistory({Key? key}) : super(key: key);

  @override
  State<StatementsHistory> createState() => _StatementsHistoryState();
}

class _StatementsHistoryState extends State<StatementsHistory> {
  //current user
  User? user = FirebaseAuth.instance.currentUser;

  //firebase reference
  final CollectionReference _reference = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _reference.doc(user?.uid).collection('statements').snapshots(),//persisten connection with db
        builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                  return SizedBox(
                    height: 75,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.paypal_sharp),
                          title: Text(documentSnapshot['name']),
                          subtitle:
                          Text("Date: "+documentSnapshot['paymentDate']+"-KSH."+documentSnapshot['amount']),
                          trailing: TextButton(onPressed: (){}, child: const Text("PAID", textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),),
                        ),
                        const Divider(color: Colors.black,),
                      ],
                    ),
                    // colors: Colors.grey,
                    // billlogo: Icons.paypal_outlined,
                    // billsName: documentSnapshot['name'],
                    // date: "Date: "+documentSnapshot['paymentDate']+"-KSH."+documentSnapshot['amount'],
                  );
                }

            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
