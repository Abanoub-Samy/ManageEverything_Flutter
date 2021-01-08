import 'package:flutter/material.dart';
import 'package:manage_everything/domain/authentication/authenticate.dart';
import 'package:manage_everything/models/churchModel.dart';
import 'file:///E:/work/army/android/flutter/ManageEverything_Flutter/lib/screens/admin/admin.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ChurchModel>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Admin();
    }
  }
}
