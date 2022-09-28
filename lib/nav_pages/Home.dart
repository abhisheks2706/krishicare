import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:krishicare/nav_pages/Nav_bar.dart';

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
      drawer: NavBar() ,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Krishi Care"),
        elevation: 0
      ),

    //nav bar


    );
  }
}
