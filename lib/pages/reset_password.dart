import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kejani/pages/user_login.dart';

class ResetPassword extends StatefulWidget{
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}
class _ResetPasswordState extends State<ResetPassword> {

  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black12),
          onPressed: () {
            // passing this to our root
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Email'
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                  color: Colors.indigoAccent[400],
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                  "Send Request",
                  style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white70),
                  ),
                  ),
              ]
          )

        ],),
    );
  }

}