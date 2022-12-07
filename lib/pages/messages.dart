// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import '/datas/user_json.dart';
import '/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text("Messages"),
        //elevation: 0,
        // backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(0, 1))
                  ]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_rounded
                          //Feather.search,
                          //color: black,
                          )),
                  const SizedBox(
                    width: 5,
                  ),
                  const Flexible(
                    child: TextField(
                      cursorColor: black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for contacts"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: List.generate(usersList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.15),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: const Offset(0, 1))
                        ],
                        color: white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(33)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: black)),
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(usersList[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                usersList[index]['name'],
                                style:
                                    const TextStyle(fontSize: 15, color: black),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(usersList[index]['message'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: black.withOpacity(0.5)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
