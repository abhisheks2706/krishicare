import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class carouselImage extends StatelessWidget {
  const carouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouseImage.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }
}

const List<String> carouseImage = [
  'https://images.yourstory.com/cs/2/f02aced0d86311e98e0865c1f0fe59a2/agritech-1592301275520.png',
  'https://www.chronicle.co.zw/wp-content/uploads/sites/3/2021/08/Modern-Farming-Technology.jpg',
  'https://www.agrifarming.in/wp-content/uploads/2018/04/Types-Of-Organic-Fertilizers.-600x330.jpg',
];
