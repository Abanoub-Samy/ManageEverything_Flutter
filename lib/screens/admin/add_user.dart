import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/services/firestoreData.dart';
import 'package:manage_everything/widgets/circle_avatar.dart';
import 'package:manage_everything/widgets/custom_card.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/custom_text_field.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';

class AddUser extends StatefulWidget {
  _AddUser createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  Responsive responsive = new Responsive();
  FireStoreData _fireStoreData = new FireStoreData();
  int selectButton;
  String error = '';
  File _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final contactController = TextEditingController();
  final classController = TextEditingController();
  final addressController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool loading = false;
  bool _managerHasBeenPressed = true;
  bool _assistantHasBeenPressed = true;
  bool _childHasBeenPressed = true;
  bool usernamePasswordVisibility = false;
  bool classVisibility = false;
  bool listViewVisibility = false;

  @override
  Widget build(BuildContext context) {
    visibilityWidget();
    return Scaffold(
        appBar: AppBar(
          title: Text(Constans.addUser),
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
                                setState(() {
                                  _image = null;
                                  selectButton = 1;
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
                                setState(() {
                                  _image = null;
                                  selectButton = 2;
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
                                setState(() {
                                  _image = null;
                                  selectButton = 3;
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
                    child: Visibility(
                      visible: listViewVisibility,
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    child: CustomCircleAvatar(
                                      radius: responsive.width(5, context),
                                      backgroundImage: _image,
                                    ),
                                    onTap: () {
                                      getImage();
                                    },
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
                                      ? (Constans.enter + Constans.name)
                                      : null,
                                  controller: nameController,
                                  hintText: Constans.name,
                                  obscureText: false,
                                ),
                              ),
                              Custom_Padding(
                                child: Custom_TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (Constans.enter + Constans.dateOfBirth)
                                      : null,
                                  controller: dateOfBirthController,
                                  hintText: Constans.dateOfBirth,
                                  keyboardType: TextInputType.datetime,
                                  obscureText: false,
                                ),
                              ),
                              Custom_Padding(
                                child: Custom_TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (Constans.enter + Constans.contact)
                                      : null,
                                  controller: contactController,
                                  hintText: Constans.contact,
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                ),
                              ),
                              Custom_Padding(
                                child: Custom_TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (Constans.enter + Constans.address)
                                      : null,
                                  controller: addressController,
                                  hintText: Constans.address,
                                  obscureText: false,
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (Constans.enter + Constans.username)
                                        : null,
                                    controller: usernameController,
                                    hintText: Constans.username,
                                    obscureText: false,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (Constans.enter + Constans.password)
                                        : null,
                                    controller: passwordController,
                                    obscureText: true,
                                    hintText: Constans.password,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (Constans.enter +
                                            Constans.confirmPassword)
                                        : null,
                                    controller: confirmPassController,
                                    obscureText: true,
                                    hintText: Constans.confirmPassword,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: classVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (Constans.enter + Constans.classs)
                                        : null,
                                    controller: classController,
                                    hintText: Constans.classs,
                                    obscureText: false,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Custom_Padding(
                                      child: CustomFlatButton(
                                        text: Constans.add,
                                        color: Constans.Button_color,
                                        onTap: add,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: Text(error),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
    nameController.dispose();
    super.dispose();
  }

  void add() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      if (passwordController.text.toString() ==
          confirmPassController.text.toString()) {
        dynamic result = await _fireStoreData.createNewManager(
            'id',
            nameController.text.toString(),
            dateOfBirthController.text.toString(),
            addressController.text.toString(),
            contactController.text.toString(),
            usernameController.text.toString(),
            passwordController.text.toString());
        if (result == null) {
          setState(() {
            error = 'email not valid';
            loading = false;
          });
        } else {
          print('every thing ok');
        }
      } else {
        print('password not equal');
      }
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void visibilityWidget() {
    if (selectButton == 1) {
      _managerHasBeenPressed
          ? listViewVisibility = false
          : listViewVisibility = true;
      classVisibility = false;
      usernamePasswordVisibility = true;
    } else if (selectButton == 2) {
      _assistantHasBeenPressed
          ? listViewVisibility = false
          : listViewVisibility = true;
      classVisibility = true;
      usernamePasswordVisibility = true;
    } else if (selectButton == 3) {
      _childHasBeenPressed
          ? listViewVisibility = false
          : listViewVisibility = true;
      classVisibility = true;
      usernamePasswordVisibility = false;
    }
  }
}
