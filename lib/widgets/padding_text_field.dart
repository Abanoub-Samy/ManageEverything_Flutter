import 'package:flutter/material.dart';
import 'package:manage_everything/const/responsive.dart';


// ignore: camel_case_types
class Custom_Padding extends StatelessWidget {

  final Widget child;

  Custom_Padding({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
    return Padding(
      padding: EdgeInsets.fromLTRB(
          responsive.width(5, context),
          responsive.width(2, context),
          responsive.width(5, context),
          responsive.width(2, context)),
      child: child,
    );
  }
}
