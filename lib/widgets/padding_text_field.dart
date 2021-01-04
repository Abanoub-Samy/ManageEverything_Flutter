import 'package:flutter/material.dart';
import '../screens/add_user.dart';

// ignore: camel_case_types
class Custom_Padding extends StatelessWidget {
  final Widget child;

  const Custom_Padding({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
