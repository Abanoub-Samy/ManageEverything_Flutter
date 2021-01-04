import 'package:flutter/material.dart';
import 'package:manage_everything/models/managerModels.dart';
import 'package:manage_everything/screens/admin.dart';
import 'package:manage_everything/constans.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/screens/wrapper.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';
import 'package:provider/provider.dart';
import 'package:manage_everything/screens/add_user.dart';
import 'package:manage_everything/screens/delete_user.dart';
import 'package:manage_everything/screens/user.dart';

// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

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
    return StreamProvider<ManagerModel>.value(
      value: AuthService().user,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('الصفحة الرئيسية'),
            centerTitle: true,
            //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
          ),
           body:Wrapper()
        ),
      ),
    );
  }
}
