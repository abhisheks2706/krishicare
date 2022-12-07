import 'package:flutter/material.dart';
import 'package:krishicare/features/nav_pages/Nav_bar.dart';
import 'package:krishicare/pages/community_page.dart';
import 'package:krishicare/pages/porfile.dart';
import 'package:provider/provider.dart';

import '../../pages/home_page.dart';
import '../../pages/screens/products_overview_screen.dart';
import '../../provider/cart.dart';
import '../../provider/orders.dart';
import '../../provider/products.dart';
import '../../views/additional_feature.dart';
import '../../views/current_weather.dart';
import 'elements/carousel_img.dart';
import 'elements/catoagories.dart';
import 'elements/crop.dart';

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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentweather(const Icon(Icons.wb_sunny_rounded), "25", "Bhopal"),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xdd212121),
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(
              height: 10.0,
            ),
            additionalInformation("10km/h", "22", "22", "44"),
            const Divider(),
            const Categories(),
            const carouselImage(),
            const Crop(),
          ],
        ),
      ),

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
            icon: Icon(Icons.message),
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
      // body: getBody(),

      //nav bar
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: _currentindex,
      children: [
        const HomePage(),
        const CommunityPage(),
        ProductsOverviewScreen(),
        const SettingsUI(),
      ],
    );
  }
}
