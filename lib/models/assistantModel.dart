import 'package:flutter/cupertino.dart';

class AssistantModel with ChangeNotifier {
  String _id;
  String _name;
  String _dateBirth;
  String _contact;
  String _address;
  String _userName;
  String _password;
  String _classes;
  bool _check1;
  bool _check2;

  AssistantModel(_id, _name, _dateBirth, _contact, _address, _userName,
      _password, _classes, _check1, _check2);

  bool get check2 => _check2;

  set check2(bool value) {
    _check2 = value;
    notifyListeners();
  }

  bool get check1 => _check1;

  set check1(bool value) {
    _check1 = value;
    notifyListeners();
  }

  String get classes => _classes;

  set classes(String value) {
    _classes = value;
    notifyListeners();
  }

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
