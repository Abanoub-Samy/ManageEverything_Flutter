import 'package:flutter/material.dart';
import '../add_user.dart';

// ignore: camel_case_types
class Padding_TextField extends StatelessWidget {
  final Widget child;

  const Padding_TextField({
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
