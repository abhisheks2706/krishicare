//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishicare/pages/LanguagePage.dart';
import 'package:krishicare/pages/LacaleString.dart';
import 'package:krishicare/features/auth/form_screen.dart';
import 'package:krishicare/pages/onboarding_screen.dart';

//verification pages
import 'package:krishicare/features/auth/verify.dart';
import 'package:krishicare/features/auth/phone.dart';

//home pages

import 'features/nav_pages/home.dart';
//import 'package:krishicare/nav_pages/myaccount.dart';
//import 'package:krishicare/nav_pages/Nav_bar.dart';
//import 'package:krishicare/nav_pages/news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("stage1");
  await Firebase.initializeApp();
  print("stage2");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    translations: LocaleString(),
    locale: Locale('hi', 'IN'),
    //var locale = Locale('hi', 'IN');
    initialRoute: 'phone',
    routes: {
      'phone': (context) => Myphone(),
      //'otp': (context) => MyVerify(),
      'Home': (context) => Myhome(),
      'Onboard': (context) => OnBoardingPage(),
      //'form': (context) => FormScreen(),
      'language': (context) => LanguagePage(),
    },
  ));
}
