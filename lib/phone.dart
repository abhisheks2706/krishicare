import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Myphone extends StatefulWidget {
   const Myphone({Key? key}) : super(key: key);

  static String verify="";


  @override
  State<Myphone> createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
   TextEditingController countrycode=TextEditingController();
   var phone ="";

  @override
  void initState(){
    // TODO: implement initState
    countrycode.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 25,right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/migf.jpg',width: 200,height: 200 ,),
                  SizedBox(
                    height: 25,
                  ),



                  Text(
                    'Phone verification ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We need to register your phone before getting started',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,

                          // child: Text("+91",style: TextStyle(fontSize: 19,color: Colors.black),),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller:countrycode ,
                            decoration: InputDecoration(border: InputBorder.none),
                          ),
                        ),

                        SizedBox(
                          width: 10,
                        ),
                        Text("|", style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value){
                              phone=value;
                          },
                            decoration: InputDecoration(border: InputBorder.none,hintText: "Phone"),style: TextStyle(fontSize: 19),),
                        ),
                      ],
                    ),
                  ),
                 SizedBox(
                   height: 20,
                 ),
                 SizedBox(
                   height: 45,
                   width: double.infinity,
                   child:  ElevatedButton(onPressed: ()  async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                       phoneNumber:'+${countrycode.text+phone}',
                       verificationCompleted: (PhoneAuthCredential credential) {},
                       verificationFailed: (FirebaseAuthException e) {},
                       codeSent: (String verificationId, int? resendToken) {
                         Myphone.verify=verificationId;
                         Navigator.pushNamed(context, "otp");

                       },
                       codeAutoRetrievalTimeout: (String verificationId) {},
                     );
                     //Navigator.pushNamed(context, "otp");
                    },
                     child: Text('Send the code'),style: ElevatedButton.styleFrom(
                       primary: Colors.green.shade600,shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                   )
                   ),)                 ,
                 )
                ],
              ),
            )));
  }
}
