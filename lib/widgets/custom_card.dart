import 'package:flutter/material.dart';
import 'file:///E:/work/army/android/flutter/ManageEverything_Flutter/lib/const/responsive.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child, this.onTap});

  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        // height: responsive.heightx(30, context),
        // width: responsive.widthx(40, context),
        margin: EdgeInsets.fromLTRB(
            responsive.width(3, context),
            responsive.height(2, context),
            responsive.width(2, context),
            responsive.height(2, context)),
      ),
    );
  }
}
