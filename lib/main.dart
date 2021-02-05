import 'package:flutter/material.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/models/organizationModel.dart';
import 'file:///E:/work/army/android/flutter/ManageEverything_Flutter/lib/screens/admin/addUser/add_user.dart';
import 'package:manage_everything/screens/admin/admin.dart';
import 'package:manage_everything/screens/admin/delete_user.dart';
import 'package:manage_everything/screens/newProject.dart';
import 'package:manage_everything/screens/user/user.dart';
import 'package:manage_everything/screens/wrapper.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<Constants>(
      create: (_) => Constants(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: constants.theme == true ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(),
      routes: {
        'main': (context) => MyApp(),
        constants.admin: (context) => Admin(),
        constants.user: (context) => User(),
        constants.addUser: (context) => AddUser(),
        constants.deleteUser: (context) => DeleteUser(),
        'wrapper': (context) => Wrapper(),
        constants.newProjectString: (context) => NewProject(),
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
    return StreamProvider<OrganizationModel>.value(
      value: AuthService().user,
      child: SafeArea(
        child: Scaffold(body: Admin()),
      ),
    );
  }
}
