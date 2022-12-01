import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBar> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
