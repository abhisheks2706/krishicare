import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:krishicare/nav_pages/Nav_bar.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {

  int _currentindex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: Text("Krishi Care"),
          elevation: 0),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedItemColor:  Colors.green.shade800,
          selectedFontSize: 17,
          unselectedFontSize: 13 ,



          items: [
        new BottomNavigationBarItem(
          backgroundColor: Colors.grey,
          icon: new Icon(Icons.house),
          label: "Home",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.car_rental),
          label: "Search",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          label: "Connections",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.account_box),
          label: "Profile",
        ),


      ],
        onTap: (index){
          setState(() {
            _currentindex=index;
          });
        },
      ),

      //nav bar
    );
  }
}
