import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//0verification pages
import 'package:krishicare/verify.dart';
import 'package:krishicare/phone.dart';

//home pages
import 'package:krishicare/nav_pages/Home.dart';
import 'package:krishicare/nav_pages/myaccount.dart';
import 'package:krishicare/nav_pages/Nav_bar.dart';
import 'package:krishicare/nav_pages/news.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await//
  //Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => Myphone(),
      'otp': (context) => MyVerify(),
      'Home': (context) => Myhome()
    },
  ));
}
