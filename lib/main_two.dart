import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishicare/features/auth/form_screen.dart';
import 'package:krishicare/pages/LanguagePage.dart';

import 'features/nav_pages/home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Myhome();
              } else {
                return LanguagePage();
              }
            }));
  }
}
