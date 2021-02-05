import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/models/organizationModel.dart';
import 'package:manage_everything/widgets/list.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';
import 'package:provider/provider.dart';

class AdminList extends StatefulWidget {
  @override
  _AdminList createState() => _AdminList();
}

class _AdminList extends State<AdminList> {
  String dropdownValue;
  bool checkValue = false;
  Responsive responsive = new Responsive();

  @override
  Widget build(BuildContext context) {
    final church = Provider.of<List<OrganizationModel>>(context);
    final constants = Provider.of<Constants>(context);
    return Scaffold(
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
                    child: Custom_Padding(
                        child: Text(
                          constants.classesList.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(6, context),
                          color: Colors.green),
                    )),
                  ),
                  Expanded(
                    child: Custom_Padding(
                        child: Text(
                          constants.classesList.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(6, context),
                          color: Colors.green),
                    )),
                  ),
                  Expanded(
                    child: Custom_Padding(
                        child: Text(
                          constants.classesList.elementAt(0),
                      style: TextStyle(
                          fontSize: responsive.width(5, context),
                          color: Colors.green),
                    )),
                  ),
                ]),
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: church.length,
                    itemBuilder: (context, index) {
                      return ListShow(organizationModel: church[index]);
                    },
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
