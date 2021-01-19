import 'package:flutter/material.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/models/churchModel.dart';
import 'package:manage_everything/screens/admin/add_user.dart';
import 'package:manage_everything/screens/admin/admin.dart';
import 'package:manage_everything/screens/admin/delete_user.dart';
import 'package:manage_everything/screens/newProject.dart';
import 'package:manage_everything/screens/user/user.dart';
import 'package:manage_everything/screens/wrapper.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
      routes: {
        'main': (context) => MyApp(),
        'admin': (context) => Admin(),
        'user': (context) => User(),
        'Add User': (context) => AddUser(),
        'Delete User': (context) => DeleteUser(),
        'wrapper': (context) => Wrapper(),
        'New Project': (context) => NewProject(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Responsive screen;
  final AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ChurchModel>.value(
      value: AuthService().user,
      child: SafeArea(
        child: Scaffold(body: Wrapper()),
      ),
    );
  }
}
