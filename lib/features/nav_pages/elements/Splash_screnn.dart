import 'dart:async';
import 'package:flutter/material.dart';
import 'package:krishicare/features/auth/phone.dart';
import 'package:krishicare/pages/LanguagePage.dart';

class MyHomeePage extends StatefulWidget {
  @override
  _MyHomeePageState createState() => _MyHomeePageState();
}

class _MyHomeePageState extends State<MyHomeePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LanguagePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            'Krishi Care',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
