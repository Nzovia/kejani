
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/request_response.dart';

//firebase instance
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//current user
User? user = FirebaseAuth.instance.currentUser;
final CollectionReference _Collection = _firestore.collection("users")
    .doc(user?.uid)
    .collection("cards");

//the class has all the crud methods on cards
class CreditCardsCRUD{

  //add card
  static Future<Response> addCard({
    required String cardNumber,
    required String amount,
    required String expiryDate,
    required String cardHolderName,
    required String cvvCode,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    //posting data to the db
    Map<String, dynamic> data = <String, dynamic>{
      'amount': amount,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'cardHolderName': cardHolderName,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Card Created Sucessfully";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //read Card Data
  static Stream<QuerySnapshot> readCard() {
    CollectionReference cardItemCollection =
        _Collection;

    return cardItemCollection.snapshots();
  }

  //updating card details
  static Future<Response> upDateCard({
    required String cardNumber,
    required String amount,
    required String expiryDate,
    required String cardHolderName,
    required String cvvCode,

    //update by docker
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'amount': amount,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'cardHolderName': cardHolderName,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Account";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //delete Card
  static Future<Response> deleteCard({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Sucessfully Deleted Card";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

}