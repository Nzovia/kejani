
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/request_response.dart';

//firebase instance
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//current user
User? user = FirebaseAuth.instance.currentUser;
final CollectionReference _Collection = _firestore.collection("users")
    .doc(user?.uid)
    .collection("bills");

//the class has all the crud methods on cards
class BillsCrud{

  //add card
  static Future<Response> addBills({
    required String? name,
    required String? amount,
    required String? balance,
    required String? logo,
    // String? priority;
    // String? status;
    required String? paymentDate
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    //posting data to the db
    Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'amount': amount,
      'balance': balance,
      'logo': logo,
      'paymentDate': paymentDate,
      // 'cardHolderName': cardHolderName,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "bill Created Successfully";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //read Bills Data
  static Stream<QuerySnapshot> readBills() {
    CollectionReference cardItemCollection =
        _Collection;

    return cardItemCollection.snapshots();
  }

  //updating card details
  static Future<Response> upDateBills({
    required String? name,
    required String? amount,
    required String? balance,
    required String? logo,
    required String? paymentDate,

    //update by docker
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'amount': amount,
      'balance': balance,
      'logo': logo,
      'paymentDate': paymentDate,
      // 'cardHolderName': cardHolderName,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated Bills";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //delete Card
  static Future<Response> deleteBill({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Successfully Deleted Bill";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

}