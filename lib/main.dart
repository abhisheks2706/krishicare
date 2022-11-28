import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishicare/pages/LanguagePage.dart';
import 'package:krishicare/pages/LacaleString.dart';
import 'package:krishicare/pages/onboarding_screen.dart';

//verification pages
import 'package:krishicare/features/auth/phone.dart';
import 'package:provider/provider.dart';

//home pages
import 'features/nav_pages/home.dart';
import 'pages/screens/cart_screen.dart';
import 'pages/screens/edit_product_screen.dart';
import 'pages/screens/orders_screen.dart';
import 'pages/screens/product_detail_screen.dart';
import 'pages/screens/products_overview_screen.dart';
import 'pages/screens/user_products_screen.dart';
import 'provider/cart.dart';
import 'provider/orders.dart';
import 'provider/products.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  print("stage1");
  //await Firebase.initializeApp();
  print("stage2");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: LocaleString(),
          locale: Locale('hi', 'IN'),
          //var locale = Locale('hi', 'IN');
          initialRoute: 'Home',
          routes: {
            'phone': (context) => Myphone(),
            //'otp': (context) => MyVerify(),
            'Home': (context) => Myhome(),
            'Onboard': (context) => OnBoardingPage(),
            //'form': (context) => FormScreen(),
            'language': (context) => LanguagePage(),
            'shop': (context) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        ));
  }
}
