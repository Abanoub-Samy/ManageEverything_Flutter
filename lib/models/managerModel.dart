import 'package:flutter/cupertino.dart';

class ManagerModel with ChangeNotifier {
  String _id;
  String _name;
  String _dateBirth;
  String _contact;
  String _address;
  String _userName;
  String _password;

  ManagerModel(
      _id, _name, _dateBirth, _contact, _address, _userName, _password);

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  String get address => _address;

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  String get contact => _contact;

  set contact(String value) {
    _contact = value;
    notifyListeners();
  }

  String get dateBirth => _dateBirth;

  set dateBirth(String value) {
    _dateBirth = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get id => _id;

  set id(String value) {
    _id = value;
    notifyListeners();
  }
}
