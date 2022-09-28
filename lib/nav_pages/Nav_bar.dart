

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(

            accountName: Text('Abhishek patel',),
            accountEmail : Text('abhiseks2706@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/farmer.png',
                  alignment: Alignment.center,
                  width:90,height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                image: AssetImage(
                  'assets/navbackground.jpg',
                ),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
           leading: Icon(Icons.favorite ),
            title: Text('Favorite'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Connections'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.share ),
            title: Text('Share'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.notifications ),
            title: Text('request'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.settings ),
            title: Text('settings'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.description ),
            title: Text('Policies'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app ),
            title: Text('Exit'),
            onTap: ()=>null,
          )
        ],
      ),

    );
  }
}
