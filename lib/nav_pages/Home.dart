import 'package:flutter/material.dart';

import 'package:krishicare/nav_pages/Nav_bar.dart';
import 'package:krishicare/pages/community_page.dart';

import '../pages/home_page.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int _currentindex = 0;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text("Krishi Care"),
          elevation: 0),
      body: getBody(),

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
            icon: Icon(Icons.add_comment_rounded),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "KrishiStore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
            pageIndex = index;
          });
        },
      ),

      //nav bar
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const CommunityPage()
      //MyCoursesPage(),
      //ExplorePage(),
      //AccountPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }
}
