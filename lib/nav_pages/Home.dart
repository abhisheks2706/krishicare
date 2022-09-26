import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}
class _MyhomeState extends State<Myhome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0
      ),



    );
  }
}
