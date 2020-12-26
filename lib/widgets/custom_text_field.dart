import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_TextField extends StatelessWidget {
  final String hintText;
  final Function onTap;
  final TextEditingController controller;

  Custom_TextField({this.hintText, this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
        hintText: hintText,
      ),
    );
  }
}
