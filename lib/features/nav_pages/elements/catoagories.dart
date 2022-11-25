import "package:flutter/material.dart";

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 55,
                    width: 65,
                  ),
                ),
              ),
              Text(
                categoryImages[index]['title']!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
    );
  }
}

const List<Map<String, String>> categoryImages = [
  {'title': 'Bazaar', 'image': 'assets/community.jpg'},
  {'title': 'Doctor', 'image': 'assets/crop_doctor.jpg'},
  {'title': 'Protection', 'image': 'assets/fertilizer.jpg'},
  {'title': 'Vedika', 'image': 'assets/kissan.jpg'},
  {'title': 'Sandesh', 'image': 'assets/sandesh.jpg'},
];
