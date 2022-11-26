import 'package:flutter/cupertino.dart';

class PhoneProvider with ChangeNotifier {
  var phone_number;

  void setphone_number(var phone) {
    phone_number = phone;
    notifyListeners();
  }
}
