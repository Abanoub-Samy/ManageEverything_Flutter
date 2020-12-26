import 'package:flutter/material.dart';
import 'package:manage_everything/admin.dart';
import 'package:manage_everything/constans.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/user.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';

import 'add_user.dart';
import 'delete_user.dart';

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
        'Delete User': (context) => DeleteUser()
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

  // @override
  // void initState() {
  //   getLocation();
  // }
  // @override
  // void deactivate() {
  //
  // }
  // void getLocation() async{
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  // }
  // void getData() async{
  //   http.Response response = await get('');
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) / 100;
    double height = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الرئيسية'),
        centerTitle: true,
        //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        10 * width, 20 * height, 10 * width, 3 * height),
                    child: CustomFlatButton(
                        color: Constans.Button_color,
                        textColor: Constans.Button_text_color,
                        onTap: () {
                          Navigator.pushNamed(context, 'admin');
                        },
                        text: Constans.Admin),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        10 * width, 5 * height, 10 * width, 10 * height),
                    child: CustomFlatButton(
                        color: Constans.Button_color,
                        textColor: Constans.Button_text_color,
                        onTap: () {
                          Navigator.pushNamed(context, 'user');
                        },
                        text: Constans.User),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
