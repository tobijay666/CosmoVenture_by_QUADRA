import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? iId;

  void setIId(String? id) {
    iId = id;
    notifyListeners();
  }
}
