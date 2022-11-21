//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myphone extends StatefulWidget {
  const Myphone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<Myphone> createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/migf.jpg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Phone verification ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'We need to register your phone before getting started',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,

                          // child: Text("+91",style: TextStyle(fontSize: 19,color: Colors.black),),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: countrycode,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              phone = value;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Phone"),
                            style: const TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+${countrycode.text + phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Myphone.verify = verificationId;
                            Navigator.pushNamed(context, "otp");
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                        //Navigator.pushNamed(context, "otp");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Send the code'),
                    ),
                  )
                ],
              ),
            )));
  }
}
