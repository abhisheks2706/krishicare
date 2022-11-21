import 'package:flutter/material.dart';
import 'package:krishicare/features/nav_pages/Nav_bar.dart';
import 'package:krishicare/views/current_weather.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text("Krishi Care"),
          elevation: 0),

      //weather body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
        currentweather(const Icon(Icons.wb_sunny_rounded), "46.3", "Bhopal")
      ]),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.green.shade800,
        selectedFontSize: 17,
        unselectedFontSize: 13,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Agri store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),

      //nav bar
    );
  }
}
