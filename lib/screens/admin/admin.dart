import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/screens/admin/showData.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:provider/provider.dart';

class Admin extends StatefulWidget {
  @override
  _MyAdmin createState() => _MyAdmin();
}

AuthService _auth = new AuthService();
bool switchControl = true;
var textHolder = 'Dark mode';

class _MyAdmin extends State<Admin> {
  int _groupValue2 = -1;

  @override
  Widget build(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String choice) {
              if (choice == constants.addUser) {
                Navigator.pushNamed(context, constants.addUser);
              } else if (choice == constants.deleteUser) {
                Navigator.pushNamed(context, constants.deleteUser);
              } else if (choice == constants.settings) {
                settingsPressed(context);
              } else if (choice == constants.signOut) {
                logOut();
                Navigator.pushNamed(context, 'main');
              }
            },
            itemBuilder: (BuildContext context) {
              return constants.choices.map((String choice) {
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

  void settingsPressed(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text(constants.stringTheme),
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: switchControl,
                  activeColor: Colors.orange,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.orange,
                  inactiveTrackColor: Colors.grey,
                ),
                Text(
                  '$textHolder',
                  style: TextStyle(fontSize: 18),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text(constants.language),
                ),
                RadioListTile(
                  value: 0,
                  groupValue: _groupValue2,
                  onChanged: (newValue) =>
                      setState(() => _groupValue2 = newValue),
                  selected: false,
                  title: Text(constants.english),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: _groupValue2,
                  onChanged: (newValue) =>
                      setState(() => _groupValue2 = newValue),
                  selected: false,
                  title: Text(constants.arabic),
                ),
              ],
            );
          });
        });
  }

  void toggleSwitch(bool value) {
    final constants = Provider.of<Constants>(context);
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        constants.theme = true;
        textHolder = constants.darkMode;
        constants.buttonColor=Colors.orange;
        constants.customCardColor=Colors.black38;
      });
    } else {
      setState(() {
        switchControl = false;
        constants.theme = false;
        textHolder = constants.lightMode;
        constants.buttonColor=Colors.blueAccent;
        constants.customCardColor=Colors.greenAccent;
      });
    }
  }
}

void logOut() async {
  await _auth.signOut();
}
