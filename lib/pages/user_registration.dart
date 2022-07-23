import 'package:flutter/material.dart';
import 'package:kejani/constants/app_colors.dart';


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
                          makeInput(label: "UserName"),
                          makeInput(label: "Email"),
                          makeInput(label: "MobileNumber"), //OTP send to login--> choose either email or phone
                          makeInput(label: "Password",obsureText: true),
                          makeInput(label: "Confirm Pasword",obsureText: true)
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
                                bottom: const BorderSide(color: Colors.black),
                                top: const BorderSide(color: Colors.black),
                                right: const BorderSide(color: Colors.black),
                                left: const BorderSide(color: Colors.black)
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
                      children: const [
                         Text("Already have an account? "),
                         Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                           color: Colors.green
                        ),),
                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(
              color: grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide:  BorderSide(color: grey)
          ),
        ),
      ),
      const SizedBox(height: 15,)

    ],
  );
}
