import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:image_picker/image_picker.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kejani/model/User.dart';
import 'package:kejani/pages/user_login.dart';

class UserRegistration extends StatefulWidget {
  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  //form key
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  //firebase
  FirebaseStorage storageReference = FirebaseStorage.instance;

  bool showSpinner = false;
  //editing controllers
  final userNameController = new TextEditingController();
  final emailAddressController = new TextEditingController();
  final userPhoneControler = new TextEditingController();
  final userPasswordController = new TextEditingController();

  //image properties to enhance 'dart:io' library
  File? _pickedImage;
  String? _uploadedFileURL;
  final uploadId = DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    //userName
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,

      //validator (usernameField validation)
      validator: (value) {
        RegExp regExp = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("user is required");
        }
        if (!regExp.hasMatch(value)) {
          return ("enter username minimum of 3 characters");
        }
        return null;
      },

      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the userName field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //userEmail
    final emailAddressField = TextFormField(
      autofocus: false,
      controller: emailAddressController,
      keyboardType: TextInputType.emailAddress,

      //validator (validate emailField)
      validator: (value) {
        if (value!.isEmpty) {
          return ("Email is required");
        }

        //reg expression for email validation
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`"
                r"{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Kindly enter a valid email!!");
        }
        //if the field has nothing
        return null;
      },
      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the email field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //userPhone
    final userPhoneNumberField = TextFormField(
      autofocus: false,
      controller: userPhoneControler,
      keyboardType: TextInputType.phone,

      //validator (validate emailField)
      validator: (value) {
        if (value!.isEmpty) {
          return ("phone number is required");
        }

        //reg expression for email validation
        if (value.length.isLowerThan(10)) {
          return ("minimum length is 10");
        }
        //if the field has nothing
        return null;
      },
      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the email field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "phone number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //userPassword
    final passwordField = TextFormField(
      autofocus: false,
      controller: userPasswordController,
      obscureText: true,

      //password validator, telling the user to enter minimum of six characters
      validator: (value) {
        RegExp regExp = RegExp(r'^>{6},$');
        if (value!.isEmpty) {
          return ("password is required");
        }
        if (regExp.hasMatch(value)) {
          return ("enter password, minimum of 6 characters");
        }
        //if the field has nothing
        return null;
      },
      onSaved: (value) {
        userPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      //styling the password field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
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
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 70,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: _pickedImage == null
                                  ? null
                                  : FileImage(_pickedImage!),
                              radius: 68,
                              child: IconButton(
                                // remove default padding here
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  pickImage();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Its free, auto-manage Bills",
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
                              userNameField,
                              const SizedBox(
                                height: 16,
                              ),
                              emailAddressField,
                              const SizedBox(
                                height: 16,
                              ),
                              userPhoneNumberField,
                              const SizedBox(
                                height: 16,
                              ),
                              passwordField,
                              // TextFormField(
                              //   controller:
                              //       TextEditingController(text: userEmail),
                              //   onChanged: (val) {
                              //     userName = val;
                              //   },
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'Name is Empty';
                              //     }
                              //     return null;
                              //   },
                              //   style: const TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black87),
                              //   decoration: InputDecoration(
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 0, horizontal: 10),
                              //       labelText: "user_name",
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       hintText: "Enter UserName",
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             width: 1, color: Colors.blue),
                              //         borderRadius: BorderRadius.circular(10),
                              //       )),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // TextFormField(
                              //   controller:
                              //       TextEditingController(text: userEmail),
                              //   onChanged: (val) {
                              //     userEmail = val;
                              //   },
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'Email is Empty';
                              //     }
                              //     return null;
                              //   },
                              //   style: const TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black87),
                              //   decoration: InputDecoration(
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 0, horizontal: 10),
                              //       labelText: "user_email",
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       hintText: "Enter your email",
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             width: 1, color: Colors.blue),
                              //         borderRadius: BorderRadius.circular(10),
                              //       )),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // TextFormField(
                              //   controller:
                              //       TextEditingController(text: userPhone),
                              //   onChanged: (val) {
                              //     userPhone = val;
                              //   },
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'Phone is Empty';
                              //     }
                              //     return null;
                              //   },
                              //   style: const TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black87),
                              //   decoration: InputDecoration(
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 0, horizontal: 10),
                              //       labelText: "user_phone",
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       hintText: "Enter your MobileNumber",
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             width: 1, color: Colors.blue),
                              //         borderRadius: BorderRadius.circular(10),
                              //       )),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // TextFormField(
                              //   controller:
                              //       TextEditingController(text: userPassword),
                              //   onChanged: (val) {
                              //     userPassword = val;
                              //   },
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'password cannot be empty';
                              //     }
                              //     return null;
                              //   },
                              //   style: const TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black87),
                              //   decoration: InputDecoration(
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 0, horizontal: 10),
                              //       labelText: "user_password",
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       hintText: "Enter your Password",
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             width: 1, color: Colors.blue),
                              //         borderRadius: BorderRadius.circular(10),
                              //       )),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // TextFormField(
                              //   controller: TextEditingController(
                              //       text: user.confirm_password),
                              //   onChanged: (val) {
                              //     user.confirm_password = val;
                              //   },
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'password mismatch';
                              //     }
                              //     return null;
                              //   },
                              //   style: const TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black87),
                              //   decoration: InputDecoration(
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 0, horizontal: 10),
                              //       labelText: "Confirm Password",
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       hintText: "Please Confirm Password",
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             width: 1, color: Colors.blue),
                              //         borderRadius: BorderRadius.circular(10),
                              //       )),
                              // ),
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
                            onPressed: () async {
                              createUser(emailAddressController.text,
                                  userPasswordController.text);
                              if (_pickedImage != null) {
                                uploadFile();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "No image selected");
                              }

                              // if (_formKey.currentState!.validate()) {
                              //   setState(() {
                              //     showSpinner = true;
                              //   });
                              //   try {
                              //     final newUser = await _auth.
                              //
                              //     if (newUser != null) {
                              //       Navigator.pushNamed(context, 'home_screen');
                              //     }
                              //   } catch (e) {
                              //     print(e);
                              //   }
                              //   setState(() {
                              //     showSpinner = false;
                              //   });
                              //}
                            },
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text(
                              "Sign Up",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.green),
                            ),
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

  Future createUser(String email, String password) async {
    //meaning -> if _formKey validation is successful, we wait for authentication
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(_uploadedFileURL)})
          .catchError((exception) {
        createUser(email, password);
        Fluttertoast.showToast(msg: "e!.message");
      });
    }
  }

  Future postDetailsToFirestore(String? uploadedFileURL) async {
    //calling  fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    //calling UserModel
    UserModel userModel = UserModel();

    //sending these values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = userNameController.text;
    userModel.phone = userPasswordController.text;
    userModel.imageUrl = _uploadedFileURL;

    //add firebaseFirestore
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "user created successfully");
    //navigating to logicScreen
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  Future uploadFile() async {
    // storageReference =
    //     firebase_storage.instance.ref().child('userimages/${uploadId}');
    firebase_storage.UploadTask uploadTask = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('userimages/${uploadId}')
        .putFile(_pickedImage!);
    //  storageReference.putFile(_pickedImage!);

    try {
      firebase_storage.TaskSnapshot snapshot = await uploadTask;
      _uploadedFileURL = await snapshot.ref.getDownloadURL();
      postDetailsToFirestore(_uploadedFileURL);
    } on FirebaseException catch (e) {
      if (e.code == "request rejected") ;
    }
    // await uploadTask.then((fileURL) {
    //   setState(() {
    //     _uploadedFileURL = fileURL as String?;
    //
    //     postDetailsToFirestore(_uploadedFileURL);
    //   });
    //   print(_uploadedFileURL);
    // });
  }

  Future pickImage() async {
    //code throws exception when user denies access permission
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => _pickedImage = imageTemporary);
    } on PlatformException catch (e) {
      print('Unable to pick image: $e');
    }
  }
}
