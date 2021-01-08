import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/screens/admin/showData.dart';
import 'package:manage_everything/services/auth.dart';

class Admin extends StatefulWidget {
  @override
  _MyAdmin createState() => _MyAdmin();
}

AuthService _auth  = new AuthService();
class _MyAdmin extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String choice) {
              if (choice == Constans.addUser) {
                print('object');
                Navigator.pushNamed(context, 'Add User');
              } else if (choice == Constans.deleteUser) {
                Navigator.pushNamed(context, 'Delete User');
              } else if (choice == Constans.settings) {
                Navigator.pushNamed(context, 'Settings');
              } else if (choice == Constans.signOut) {
                 logOut();
                 Navigator.pushNamed(context, 'main');
              }
            },
            itemBuilder: (BuildContext context) {
              return Constans.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice, child: Text(choice));
              }).toList();
            },
          ),
        ],
      ),
      body: ShowData(),
    );
  }

}
void logOut() async{
  await _auth.signOut();
}
