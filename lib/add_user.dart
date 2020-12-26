import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/constans.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/widgets/custom_card.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/custom_text_field.dart';

import 'widgets/circle_avatar.dart';

class AddUser extends StatefulWidget {
  _AddUser createState() => _AddUser();
}

Responsive responsive = new Responsive();

class _AddUser extends State<AddUser> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final classController = TextEditingController();
  final addressController = TextEditingController();
  bool _ManagerhasBeenPressed = true;
  bool _AssistanthasBeenPressed = true;
  bool _ChildhasBeenPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: responsive.height(12, context),
                  width: responsive.width(100, context),
                  child: Expanded(
                    child: CustomCard(
                      color: Colors.black38,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomFlatButton(
                              color: _ManagerhasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _ManagerhasBeenPressed =
                                      !_ManagerhasBeenPressed;
                                  _AssistanthasBeenPressed = true;
                                  _ChildhasBeenPressed = true;
                                });
                              },
                              text: Constans.manager,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _AssistanthasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _ManagerhasBeenPressed = true;
                                  _AssistanthasBeenPressed =
                                      !_AssistanthasBeenPressed;
                                  _ChildhasBeenPressed = true;
                                });
                              },
                              text: Constans.assistant,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _ChildhasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _ManagerhasBeenPressed = true;
                                  _AssistanthasBeenPressed = true;
                                  _ChildhasBeenPressed = !_ChildhasBeenPressed;
                                });
                              },
                              text: Constans.child,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: circleAvatar(
                                assetImage: 'images/placeperson.png',
                                radius: Constans.Circle_Avatar_Radius,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              responsive.width(5, context),
                              responsive.width(5, context),
                              responsive.width(5, context),
                              responsive.width(2, context)),
                          child: Custom_TextField(
                            controller: firstNameController,
                            hintText: Constans.firstName,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              responsive.width(5, context),
                              responsive.width(2, context),
                              responsive.width(5, context),
                              responsive.width(2, context)),
                          child: Custom_TextField(
                            controller: lastNameController,
                            hintText: Constans.lastName,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              responsive.width(5, context),
                              responsive.width(2, context),
                              responsive.width(5, context),
                              responsive.width(2, context)),
                          child: Custom_TextField(
                            controller: contactController,
                            hintText: Constans.contact,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              responsive.width(5, context),
                              responsive.width(2, context),
                              responsive.width(5, context),
                              responsive.width(2, context)),
                          child: Custom_TextField(
                            controller: addressController,
                            hintText: Constans.address,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              responsive.width(5, context),
                              responsive.width(2, context),
                              responsive.width(5, context),
                              responsive.width(2, context)),
                          child: Custom_TextField(
                            controller: classController,
                            hintText: Constans.classs,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    responsive.width(5, context),
                                    responsive.width(2, context),
                                    responsive.width(5, context),
                                    responsive.width(2, context)),
                                child: CustomFlatButton(
                                  text: Constans.save,
                                  color: Constans.Button_color,
                                  onTap: save,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void save() {
    print(firstNameController.text);
    firstNameController.clear();
  }
}
