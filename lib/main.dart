//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishicare/pages/form_screen.dart';
import 'package:krishicare/pages/onboarding_screen.dart';

//verification pages
import 'package:krishicare/pages/verify.dart';
import 'package:krishicare/pages/phone.dart';

//home pages
import 'package:krishicare/nav_pages/Home.dart';
//import 'package:krishicare/nav_pages/myaccount.dart';
//import 'package:krishicare/nav_pages/Nav_bar.dart';
//import 'package:krishicare/nav_pages/news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("stage1");
  // await Firebase.initializeApp();
  print("stage2");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'form',
    routes: {
      'phone': (context) => Myphone(),
      'otp': (context) => MyVerify(),
      'Home': (context) => Myhome(),
      'Onboard': (context) => OnBoardingPage(),
      'form': (context) => FormScreen()
    },
  ));
}
