import 'package:flutter/material.dart';

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
                child: Image.asset(
                  'assets/farmer.png',
                  alignment: Alignment.center,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
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
            leading: const Icon(Icons.account_box),
            title: const Text('User profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
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
                  .pushReplacementNamed(UserProductsScreen.routeName);
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
            onTap: () {},
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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
