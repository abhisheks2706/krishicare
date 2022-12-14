import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/orders.dart' show Orders;
import '../../widgets/shop_widgets.dart/app_drawer.dart';
import '../../widgets/shop_widgets.dart/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
