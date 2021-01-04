import 'package:flutter/material.dart';
import 'package:manage_everything/domain/authentication/authenticate.dart';
import 'package:manage_everything/models/managerModels.dart';
import 'package:manage_everything/screens/admin.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ManagerModel>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Admin();
    }
  }
}
