import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteUser extends StatefulWidget {
  _DeleteUser createState() => _DeleteUser();
}

class _DeleteUser extends State<DeleteUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
