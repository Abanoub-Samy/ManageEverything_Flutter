import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/constans.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:manage_everything/widgets/custom_card.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/custom_text_field.dart';
import '../widgets/circle_avatar.dart';
import '../widgets/padding_text_field.dart';

class AddUser extends StatefulWidget {
  _AddUser createState() => _AddUser();
}

Responsive responsive = new Responsive();
final AuthService _auth = new AuthService();

class _AddUser extends State<AddUser> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final classController = TextEditingController();
  final addressController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool _managerHasBeenPressed = true;
  bool _assistantHasBeenPressed = true;
  bool _childHasBeenPressed = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: responsive.height(12, context),
                    width: responsive.width(100, context),
                    child: CustomCard(
                      color: Colors.black38,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomFlatButton(
                              color: _managerHasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _managerHasBeenPressed =
                                      !_managerHasBeenPressed;
                                  _assistantHasBeenPressed = true;
                                  _childHasBeenPressed = true;
                                });
                              },
                              text: Constans.manager,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _assistantHasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _managerHasBeenPressed = true;
                                  _assistantHasBeenPressed =
                                      !_assistantHasBeenPressed;
                                  _childHasBeenPressed = true;
                                });
                              },
                              text: Constans.assistant,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _childHasBeenPressed
                                  ? Constans.Button_color
                                  : Constans.Button_change_color,
                              onTap: () {
                                save();
                                setState(() {
                                  _managerHasBeenPressed = true;
                                  _assistantHasBeenPressed = true;
                                  _childHasBeenPressed = !_childHasBeenPressed;
                                });
                              },
                              text: Constans.child,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Form(
                  key: _formKey,
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
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter first name'
                                    : null,
                                controller: firstNameController,
                                hintText: Constans.firstName,
                                obscureText: false,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter last name'
                                    : null,
                                controller: lastNameController,
                                hintText: Constans.lastName,
                                obscureText: false,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter contact'
                                    : null,
                                controller: contactController,
                                hintText: Constans.contact,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter address'
                                    : null,
                                controller: addressController,
                                hintText: Constans.address,
                                obscureText: false,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter user name'
                                    : null,
                                controller: usernameController,
                                hintText: Constans.username,
                                obscureText: false,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter password'
                                    : null,
                                controller: passwordController,
                                obscureText: true,
                                hintText: Constans.password,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter confirm password'
                                    : null,
                                controller: confirmPassController,
                                obscureText: true,
                                hintText: Constans.confirmpassword,
                              ),
                            ),
                            Custom_Padding(
                              child: Custom_TextFormField(
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter class name'
                                    : null,
                                controller: classController,
                                hintText: Constans.classs,
                                obscureText: false,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Custom_Padding(
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
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void save() async {
    if (_formKey.currentState.validate()) {
      if (passwordController.value.toString() ==
          confirmPassController.value.toString()) {
        dynamic result = await _auth.registerWithEmailAndPassword(
            usernameController.value.toString(),
            passwordController.value.toString());
        if (result == null) {
          print("not ok");
        } else {
          print('every thing ok');
        }
      } else {
        print('password not equal');
      }
    }
  }
}
