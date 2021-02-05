import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:manage_everything/services/firestoreData.dart';

abstract class AddUserController extends State {
  FireStoreData _fireStoreData = new FireStoreData();

  // void add(
  //     GlobalKey<FormState> formKey,
  //     bool loading,
  //     String passwordController,
  //     String confirmPassController,
  //     String nameController,
  //     String dateOfBirthController,
  //     String addressController,
  //     String contactController,
  //     String usernameController,
  //     String error) async {
  //   if (formKey.currentState.validate()) {
  //     setState(() {
  //       loading = true;
  //     });
  //     if (passwordController == confirmPassController) {
  //       dynamic result = await _fireStoreData.createNewManager(
  //         'id',
  //         nameController,
  //         dateOfBirthController,
  //         addressController,
  //         contactController,
  //         usernameController,
  //         passwordController,
  //       );
  //       if (result == null) {
  //         setState(() {
  //           error = 'email not valid';
  //           loading = false;
  //         });
  //       } else {
  //         print('every thing ok');
  //       }
  //     } else {
  //       print('password not equal');
  //     }
  //   }
  // }


  Future getImage(ImagePicker picker ,File _image) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // void visibilityWidget(int selectButton,bool _managerHasBeenPressed,
  //     bool listViewVisibility,
  //     bool classVisibility,
  //     bool usernamePasswordVisibility,
  //     bool _assistantHasBeenPressed,
  //     bool _childHasBeenPressed
  //     ) {
  //   if (selectButton == 1) {
  //     _managerHasBeenPressed
  //         ? listViewVisibility = false
  //         : listViewVisibility = true;
  //     classVisibility = false;
  //     usernamePasswordVisibility = true;
  //   } else if (selectButton == 2) {
  //     _assistantHasBeenPressed
  //         ? listViewVisibility = false
  //         : listViewVisibility = true;
  //     classVisibility = true;
  //     usernamePasswordVisibility = true;
  //   } else if (selectButton == 3) {
  //     _childHasBeenPressed
  //         ? listViewVisibility = false
  //         : listViewVisibility = true;
  //     classVisibility = true;
  //     usernamePasswordVisibility = false;
  //   }
  // }

  // selectDate(BuildContext context,DateTime _selectedDate,TextEditingController dateOfBirthController) async {
  //   DateTime newSelectedDate = await showDatePicker(
  //       context: context,
  //       initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
  //       firstDate: DateTime(1950),
  //       lastDate: DateTime(2040),
  //       builder: (BuildContext context, Widget child) {
  //         return Theme(
  //           data: ThemeData.dark().copyWith(
  //             colorScheme: ColorScheme.dark(
  //               primary: Colors.orange,
  //               onPrimary: Colors.white,
  //               surface: Colors.orange,
  //               onSurface: Colors.white,
  //             ),
  //             dialogBackgroundColor: Colors.black,
  //           ),
  //           child: child,
  //         );
  //       });
  //
  //   if (newSelectedDate != null) {
  //     _selectedDate = newSelectedDate;
  //     dateOfBirthController
  //       ..text = DateFormat.yMMMd().format(_selectedDate)
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: dateOfBirthController.text.length,
  //           affinity: TextAffinity.upstream));
  //   }
  // }
}
