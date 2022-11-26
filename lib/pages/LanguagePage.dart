import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishicare/features/auth/phone.dart';

import '../constants/global_variable.dart';

class LanguagePage extends StatelessWidget {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.secondaryColor,
          title: Text("Krishi care".tr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            width: width,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hello'.tr,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Choose your language'.tr,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          var locale = Locale('en', 'US');
                          Get.updateLocale(locale);
                        },
                        child: Text(
                          'English',
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var locale = Locale('hi', 'IN');
                          Get.updateLocale(locale);
                        },
                        child: Text(
                          'Hindi'.tr,
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Myphone()));
                    },
                    child: Text(
                      'next'.tr,
                      style: TextStyle(fontSize: 25),
                    )),
              ],
            ),
          ),
        ));
  }
}
