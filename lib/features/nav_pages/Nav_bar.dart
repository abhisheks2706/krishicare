import 'package:flutter/material.dart'
    show
        Alignment,
        AssetImage,
        BoxDecoration,
        BoxFit,
        BuildContext,
        CircleAvatar,
        ClipOval,
        Colors,
        DecorationImage,
        Divider,
        Drawer,
        EdgeInsets,
        Icon,
        Icons,
        Image,
        Key,
        ListTile,
        ListView,
        MaterialPageRoute,
        Navigator,
        State,
        StatefulWidget,
        Text,
        UserAccountsDrawerHeader,
        Widget;
import 'package:krishicare/pages/screens/products_overview_screen.dart';
import 'package:krishicare/widgets/shop_widgets.dart/app_drawer.dart';

import '../../pages/screens/orders_screen.dart';
import '../../pages/screens/user_products_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppDrawer();
  }
}
