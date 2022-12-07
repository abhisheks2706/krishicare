import 'package:flutter/material.dart';
import 'package:krishicare/features/auth/phone.dart';
import 'package:krishicare/features/nav_pages/home.dart';
import 'package:krishicare/pages/porfile.dart';
import 'package:krishicare/pages/screens/cart_screen.dart';
import 'package:krishicare/pages/settings.dart';

import '../../pages/news/news.dart';
import '../../pages/screens/orders_screen.dart';
import '../../pages/screens/products_overview_screen.dart';
import '../../pages/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Abhishek patel',
            ),
            accountEmail: const Text('abhiseks2706@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SettingsUI.routeName);
                  },
                  child: Image.asset(
                    'assets/farmer.png',
                    alignment: Alignment.center,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                  image: AssetImage(
                    'assets/navbackground.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_sharp),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Myhome()));

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Myhome()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('User profile'),
            onTap: () {
              //Navigator.of(context).pushNamed(SettingsUI.routeName);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SettingsUI()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My orders'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => ProductsOverviewScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Fertilizer Calculator'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Change Language'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            onTap: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Refer a Farmer'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.warning),
            title: const Text('Help Guide'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text('news'),
            onTap: () {
              Navigator.of(context).pushNamed(NewsPage.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Myphone()),
              (route) => false,
            ),
          )
        ],
      ),
    );
  }
}
