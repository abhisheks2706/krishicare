import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  get shape => StadiumBorder();

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        //style: ,
        //child:
        //color c= const Color(0xFF42A5F5);,
        //shape
        //shape,
        //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
