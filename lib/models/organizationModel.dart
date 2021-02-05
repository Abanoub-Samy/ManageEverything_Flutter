import 'package:flutter/widgets.dart';

class OrganizationModel with ChangeNotifier{
   String _organizationName;



  OrganizationModel({organizationName});

   String get organizationName => _organizationName;

  set organizationName(String value) {
    _organizationName = value;
    notifyListeners();
  }
}