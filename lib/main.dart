



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishicare/Home.dart';
import 'package:krishicare/verify.dart';
import 'package:krishicare/phone.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {'phone': (context) => Myphone(), 'otp': (context) => MyVerify(), 'Home': (context)=>Myhome()},
  ));
}
