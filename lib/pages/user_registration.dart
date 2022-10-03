import 'package:flutter/material.dart';
import 'package:kejani/constants/app_colors.dart';
import 'package:kejani/pages/user_login.dart';


class UserRegistration extends StatelessWidget {
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
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0,50.0,10.0,0.0),
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
                          const Text ("Create Account", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(height: 10,),
                          Text("Its free, auto-manage Bills",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),),
                          const SizedBox(height: 15,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "user_name",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter UserName",
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "user_email",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter your email",
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "user_phone",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter your MobileNumber",
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "user_password",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter your Password",
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "Confirm Password",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Please Confirm Password",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3,left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black)
                              )
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height:45,
                            onPressed: (){},
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: const Text("Sign Up",style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 16,

                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                           const Text("Already have an account? "),
                           GestureDetector(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
                             },
                             child: const Text("Login",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                               color: Colors.green
                          ),),
                           ),
                        ],
                      )
                    ],

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

