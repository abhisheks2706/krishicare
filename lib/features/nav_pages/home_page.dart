import 'package:flutter/material.dart';
import 'package:krishicare/features/nav_pages/elements/last.dart';
import 'package:krishicare/widgets/shop_widgets.dart/app_drawer.dart';
import '../../views/additional_feature.dart';
import '../../views/current_weather.dart';
import 'elements/carousel_img.dart';
import 'elements/catoagories.dart';
import 'elements/crop.dart';

class MyWidget extends StatefulWidget {
  static const routeName = '/mainpage';

  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text("Krishi Care"),
          elevation: 0),
      drawer: AppDrawer(),
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
            const Catlog(),
          ],
        ),
      ),
    );
  }
}
