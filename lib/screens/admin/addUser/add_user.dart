import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/controls/addUserController.dart';
import 'package:manage_everything/screens/admin/addUser/customButtonsForAddUserPage.dart';
import 'package:manage_everything/services/firestoreData.dart';
import 'package:manage_everything/widgets/circle_avatar.dart';
import 'package:manage_everything/widgets/custom_card.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/custom_text_field.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  _AddUser createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  FireStoreData _fireStoreData = new FireStoreData();
  Responsive responsive = new Responsive();
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
  DateTime _selectedDate;
  AddUserController addUserController;

  @override
  Widget build(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    visibilityWidget();
    return Scaffold(
        appBar: AppBar(
          title: Text(constants.addUser),
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
                      color: constants.customCardColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomFlatButton(
                              color: _managerHasBeenPressed
                                  ? constants.buttonColor
                                  : constants.buttonChangeColor,
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
                              text: constants.manager,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _assistantHasBeenPressed
                                  ? constants.buttonColor
                                  : constants.buttonChangeColor,
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
                              text: constants.assistant,
                            ),
                          ),
                          Expanded(
                            child: CustomFlatButton(
                              color: _childHasBeenPressed
                                  ? constants.buttonColor
                                  : constants.buttonChangeColor,
                              onTap: () {
                                setState(() {
                                  _image = null;
                                  selectButton = 3;
                                  _managerHasBeenPressed = true;
                                  _assistantHasBeenPressed = true;
                                  _childHasBeenPressed = !_childHasBeenPressed;
                                });
                              },
                              text: constants.child,
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
                                      addUserController.getImage(
                                          picker, _image);
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
                                      ? (constants.enter + constants.name)
                                      : null,
                                  controller: nameController,
                                  hintText: constants.name,
                                  obscureText: false,
                                ),
                              ),
                              Custom_Padding(
                                child: TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (constants.enter +
                                          constants.dateOfBirth)
                                      : null,
                                  controller: dateOfBirthController,
                                  focusNode: AlwaysDisabledFocusNode(),
                                  keyboardType: TextInputType.datetime,
                                  obscureText: false,
                                  textInputAction: TextInputAction.search,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.black38,
                                    hintText: constants.dateOfBirth,
                                  ),
                                  onTap: () {
                                    selectDate(context);
                                  },
                                ),
                              ),
                              Custom_Padding(
                                child: Custom_TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (constants.enter + constants.contact)
                                      : null,
                                  controller: contactController,
                                  hintText: constants.contact,
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                ),
                              ),
                              Custom_Padding(
                                child: Custom_TextFormField(
                                  validator: (val) => val.toString().isEmpty
                                      ? (constants.enter + constants.address)
                                      : null,
                                  controller: addressController,
                                  hintText: constants.address,
                                  obscureText: false,
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (constants.enter + constants.username)
                                        : null,
                                    controller: usernameController,
                                    hintText: constants.username,
                                    obscureText: false,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (constants.enter + constants.password)
                                        : null,
                                    controller: passwordController,
                                    obscureText: true,
                                    hintText: constants.password,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: usernamePasswordVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (constants.enter +
                                            constants.confirmPassword)
                                        : null,
                                    controller: confirmPassController,
                                    obscureText: true,
                                    hintText: constants.confirmPassword,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: classVisibility,
                                child: Custom_Padding(
                                  child: Custom_TextFormField(
                                    validator: (val) => val.toString().isEmpty
                                        ? (constants.enter + constants.classes)
                                        : null,
                                    controller: classController,
                                    hintText: constants.classes,
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
                                        text: constants.add,
                                        color: constants.buttonColor,
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
      if (passwordController == confirmPassController) {
        dynamic result = await _fireStoreData.createNewManager(
          'id',
          nameController.text.toString(),
          dateOfBirthController.text.toString(),
          addressController.text.toString(),
          contactController.text.toString(),
          usernameController.text.toString(),
          passwordController.text.toString(),
        );
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

  selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.orange,
                onPrimary: Colors.white,
                surface: Colors.orange,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.black,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dateOfBirthController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateOfBirthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
  // void managerButtonPressed(){
  //   _image = null;
  //   selectButton = 1;
  //   _managerHasBeenPressed =
  //   !_managerHasBeenPressed;
  //   _assistantHasBeenPressed = true;
  //   _childHasBeenPressed = true;
  // }
  // void assistantButtonPressed(){
  //   _image = null;
  //   selectButton = 2;
  //   _managerHasBeenPressed = true;
  //   _assistantHasBeenPressed =
  //   !_assistantHasBeenPressed;
  //   _childHasBeenPressed = true;
  // }
  // void userButtonPressed(){
  //   _image = null;
  //   selectButton = 3;
  //   _managerHasBeenPressed = true;
  //   _assistantHasBeenPressed = true;
  //   _childHasBeenPressed = !_childHasBeenPressed;
  // }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

