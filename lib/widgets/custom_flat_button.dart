import 'package:flutter/material.dart';
import 'package:manage_everything/const/responsive.dart';



class CustomFlatButton extends StatelessWidget {

  CustomFlatButton(
      {this.textColor, this.color, @required this.onTap, @required this.text});

  final Color color;
  final Color textColor;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
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
