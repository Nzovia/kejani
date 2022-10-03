import 'package:flutter/material.dart';

class AddBillItem extends StatefulWidget {
  const AddBillItem({Key? key}) : super(key: key);

  @override
  State<AddBillItem> createState() => _AddBillItemState();
}

class _AddBillItemState extends State<AddBillItem> {
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
                          const Text ("Create a New bill", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(height: 10,),
                          Text("Add a new bill ",style: TextStyle(
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
                                  labelText: "billId",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter billId",
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
                                  labelText: "BillAmount",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "billBalance",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
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
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "logo",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter your billLogo",
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
                                  labelText: "billName",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter billName",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "billPriority",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter billPriority",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "billStatus",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter billStatus",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),

                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "paymentDate",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter paymentDate",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "userIdentity",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: "Enter userIdentity",
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
                            color: Colors.indigoAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: const Text("Add bill",style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 16,

                            ),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
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
