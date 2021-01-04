import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_TextFormField extends StatelessWidget {
  final String hintText;
  final Function onTap;
  final Function validator;
  final TextEditingController controller;
  final bool obscureText ;
  final TextInputType keyboardType;
  Custom_TextFormField({this.hintText, this.onTap, this.controller, this.validator, this.obscureText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
