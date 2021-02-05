import 'package:flutter/material.dart';
import 'package:manage_everything/models/organizationModel.dart';
import 'package:manage_everything/screens/admin/adminList.dart';
import 'package:manage_everything/services/firestoreData.dart';
import 'package:provider/provider.dart';


class ShowData extends StatefulWidget {
  @override
  _ShowData createState() => _ShowData();
}

class _ShowData extends State<ShowData>{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OrganizationModel>>.value(
      value: FireStoreData().churchData,
      child: Scaffold(
        body: AdminList(),
      ),
    );
  }

}