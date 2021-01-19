import 'dart:io';
import 'package:flutter/material.dart';
import 'package:manage_everything/const/responsive.dart';

Responsive responsive = new Responsive();

class CustomCircleAvatar extends StatelessWidget {
  CustomCircleAvatar({@required this.backgroundImage, @required this.radius});

  final File backgroundImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: responsive.width(radius, context),
      backgroundImage: backgroundImage == null
          ? AssetImage('images/placeperson.png')
          : FileImage(backgroundImage),
    );
  }
}
