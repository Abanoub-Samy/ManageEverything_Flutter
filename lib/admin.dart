import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/constans.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';

class Admin extends StatefulWidget {
  @override
  _MyAdmin createState() => _MyAdmin();
}

String dropdownValue = 'Choose the class ....';
bool checkValue = false;

class _MyAdmin extends State<Admin> {
  Responsive responsive = new Responsive();

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) / 100;
    double height = (MediaQuery.of(context).size.height) / 100;

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
                Navigator.pushNamed(context, 'SignOut');
              }
            },
            itemBuilder: (BuildContext context) {
              return Constans.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice, child: Text(choice));
              }).toList();
            },
          )
        ],
        title: Text('Admin Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 20,
                    elevation: 16,
                    style: TextStyle(color: Colors.white),
                    underline: Container(
                      height: 3,
                      color: Colors.orange,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Choose the class ....',
                      'One',
                      'Two',
                      'three',
                      'Four'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              Card(
                child: Row(children: [
                  Expanded(
                    child: Padding_TextField(
                        child: Text(
                      Constans.classes.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(6, context),
                          color: Colors.green),
                    )),
                  ),
                  Expanded(
                    child: Padding_TextField(
                        child: Text(
                      Constans.classes.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(6, context),
                          color: Colors.green),
                    )),
                  ),
                  Expanded(
                    child: Padding_TextField(
                        child: Text(
                      Constans.classes.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(5, context),
                          color: Colors.green),
                    )),
                  ),
                ]),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Card(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    responsive.width(2, context),
                                    2,
                                    responsive.width(2, context),
                                    2),
                                child: Text('cxcxc'),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    responsive.width(19, context),
                                    2,
                                    responsive.width(2, context),
                                    2),
                                child: Checkbox(
                                  value: checkValue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      checkValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    responsive.width(16, context),
                                    2,
                                    responsive.width(2, context),
                                    2),
                                child: Checkbox(
                                  value: checkValue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      checkValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ));
                    },
                    itemCount: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void choiceAction(String choice) {
//   if (choice == Constans.AddUser) {
//     print('object');
//     Navigator.pushNamed(context, 'Add User');
//   } else if (choice == Constans.DeleteUser) {
//     Navigator.pushNamed(context, 'Delete User');
//   } else if (choice == Constans.Settings) {
//     Navigator.pushNamed(context, 'Settings');
//   } else if (choice == Constans.SignOut) {
//     Navigator.pushNamed(context, 'SignOut');
//   }
// }
