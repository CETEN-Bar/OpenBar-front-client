import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  int _userId = 0;
  String _username = "";
  String image = "";
  bool get isConnected => _userId != 0;
  List<String> groups = [];
  num balance = 0;

  String getUsername() {
    return _username;
  }

  bool connect(String username, String password) {
    if (password == 'password') {
      _username = username;
      _userId = 1;
      groups = ["admin", "3A"];
      balance = 233.22;

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void disconnect() {
    _userId = 0;
    _username = "";
    notifyListeners();
  }
}
