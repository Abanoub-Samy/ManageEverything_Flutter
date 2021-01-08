import 'package:flutter/material.dart';

import '../const/responsive.dart';

Responsive responsive = new Responsive();

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton(
      {this.textColor, this.color, @required this.onTap, @required this.text});

  Color color;
  final Color textColor;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: FlatButton(
        textColor: textColor,
        color: color,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        onPressed: onTap,
        child: Text(text,
            style: TextStyle(fontSize: responsive.width(4, context))),
      ),
    );
  }
}
