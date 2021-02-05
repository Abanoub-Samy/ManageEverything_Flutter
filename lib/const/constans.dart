import 'package:flutter/material.dart';

class Constants with ChangeNotifier {
  bool _theme = true;
  String _stringTheme = 'Theme';
  String _darkMode = 'Dark Mode';
  String _lightMode = 'Light Mode';
  String _language = 'Language';
  String _english = 'English';
  String _arabic = 'Arabic';

  ////////////////////////// Colors /////////////////////////////
  Color _buttonColor = Colors.orange;
  Color _buttonChangeColor = Colors.green;
  Color _buttonTextColor = Colors.white;
  Color _customCardColor = Colors.black38;

  ////////////// Strings ////////////////////////////
  String _admin = "Admin";
  String _user = "User";
  String _addUser = "Add User";
  String _deleteUser = "Delete User";
  String _settings = "Settings";
  String _signOut = "Sign Out";
  String _name = "name..";
  String _dateOfBirth = "Date of Birth..";
  String _contact = "contact..";
  String _classes = "class..";
  String _address = "address..";
  String _username = "username..";
  String _password = "password..";
  String _confirmPassword = "confirm password..";
  String _manager = "Manager";
  String _assistant = "Assistant";
  String _child = "Child";
  String _add = "Add";
  String _newProjectString = 'New Project';
  String _enter = 'enter';

  ////////////////////////// Doubles //////////////////////////
  double _circleAvatarRadius = 20;

  ////////////////////////// Lists ////////////////////////////

  List<String> choices = <String>[
    'Add User',
    'Delete User',
    'Settings',
    'Sign Out'
  ];
  List<String> newProject = <String>['New Project'];
  List<String> classesList = <String>[
    'class 1',
    'class 2',
    'class 3',
    'class 4'
  ];

  ////////////////////////// Strings /////////////////////////////

  bool get theme => _theme;

  set theme(bool value) {
    _theme = value;
    notifyListeners();
  }

  Color get buttonColor => _buttonColor;

  set buttonColor(Color value) {
    _buttonColor = value;
    notifyListeners();
  }

  double get circleAvatarRadius => _circleAvatarRadius;

  set circleAvatarRadius(double value) {
    _circleAvatarRadius = value;
    notifyListeners();
  }

  String get enter => _enter;

  set enter(String value) {
    _enter = value;
    notifyListeners();
  }

  String get newProjectString => _newProjectString;

  set newProjectString(String value) {
    _newProjectString = value;
    notifyListeners();
  }

  String get add => _add;

  set add(String value) {
    _add = value;
    notifyListeners();
  }

  String get child => _child;

  set child(String value) {
    _child = value;
    notifyListeners();
  }

  String get assistant => _assistant;

  set assistant(String value) {
    _assistant = value;
    notifyListeners();
  }

  String get manager => _manager;

  set manager(String value) {
    _manager = value;
    notifyListeners();
  }

  String get confirmPassword => _confirmPassword;

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get username => _username;

  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String get address => _address;

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  String get classes => _classes;

  set classes(String value) {
    _classes = value;
    notifyListeners();
  }

  String get contact => _contact;

  set contact(String value) {
    _contact = value;
    notifyListeners();
  }

  String get dateOfBirth => _dateOfBirth;

  set dateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get signOut => _signOut;

  set signOut(String value) {
    _signOut = value;
    notifyListeners();
  }

  String get settings => _settings;

  set settings(String value) {
    _settings = value;
    notifyListeners();
  }

  String get deleteUser => _deleteUser;

  set deleteUser(String value) {
    _deleteUser = value;
    notifyListeners();
  }

  String get user => _user;

  set user(String value) {
    _user = value;
    notifyListeners();
  }

  String get admin => _admin;

  set admin(String value) {
    _admin = value;
    notifyListeners();
  }

  Color get buttonTextColor => _buttonTextColor;

  set buttonTextColor(Color value) {
    _buttonTextColor = value;
    notifyListeners();
  }

  Color get buttonChangeColor => _buttonChangeColor;

  set buttonChangeColor(Color value) {
    _buttonChangeColor = value;
    notifyListeners();
  }

  String get addUser => _addUser;

  set addUser(String value) {
    _addUser = value;
    notifyListeners();
  }

  String get language => _language;

  set language(String value) {
    _language = value;
    notifyListeners();
  }

  String get lightMode => _lightMode;

  set lightMode(String value) {
    _lightMode = value;
    notifyListeners();
  }

  String get darkMode => _darkMode;

  set darkMode(String value) {
    _darkMode = value;
    notifyListeners();
  }

  String get stringTheme => _stringTheme;

  set stringTheme(String value) {
    _stringTheme = value;
    notifyListeners();
  }

  String get arabic => _arabic;

  set arabic(String value) {
    _arabic = value;
    notifyListeners();
  }

  String get english => _english;

  set english(String value) {
    _english = value;
    notifyListeners();
  }

  Color get customCardColor => _customCardColor;

  set customCardColor(Color value) {
    _customCardColor = value;
    notifyListeners();
  }
}
