

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
           leading: Icon(Icons.account_box ),
            title: Text('User profile'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My orders'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calculate ),
            title: Text('Fertilizer Calculator'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.language ),
            title: Text('Change Language'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.settings ),
            title: Text('settings'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.person_add ),
            title: Text('Refer a Farmer'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.warning ),
            title: Text('Help Guide'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app ),
            title: Text('Sign Out'),
            onTap: ()=>null,
          )

        ],
      ),

    );
  }
}
