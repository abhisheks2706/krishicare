import 'package:flutter/material.dart';
import 'package:krishicare/features/nav_pages/Nav_bar.dart';
import 'package:krishicare/features/nav_pages/elements/carousel_img.dart';
import 'package:krishicare/features/nav_pages/elements/catoagories.dart';
import 'package:krishicare/features/nav_pages/elements/crop.dart';
import 'package:krishicare/model/weather_models.dart';
import 'package:krishicare/services/weather_api_client.dart';
import 'package:krishicare/views/additional_feature.dart';
import 'package:krishicare/views/current_weather.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  WeatherApiClient client = WeatherApiClient();

  //Weather
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client.getCurrentWeather("bhopal");
  }

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

const List<Map<String, String>> categoryImages = [
  {'title': 'hotels', 'image': 'assets/images/img.png'},
  {'title': 'hotels', 'image': 'assets/images/one.png'},
  {'title': 'hotels', 'image': 'assets/images/two.png'},
  {'title': 'hotels', 'image': 'assets/images/three.png'},
  {'title': 'hotels', 'image': 'assets/images/three.png'},
  {'title': 'hotels', 'image': 'assets/images/three.png'},
  {'title': 'hotels', 'image': 'assets/images/one.png'},
  {'title': 'hotels', 'image': 'assets/images/img.png'},
];
