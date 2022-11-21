import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget currentweather(Icon icon, String temp, String location) {
  return Center(
    child: Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Icon(
                icon.icon,
                color: Colors.orange,
                size: 64.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                location,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(
                      0xFF5a5a5a,
                    )),
              )
            ],
          )
        ],
      ),
    ),
  );
}
