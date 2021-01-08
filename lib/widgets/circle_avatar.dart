import 'package:flutter/material.dart';
import 'file:///E:/work/army/android/flutter/ManageEverything_Flutter/lib/const/responsive.dart';

class circleAvatar extends StatelessWidget {
  final String assetImage;
  final double radius;
  Responsive responsive = new Responsive();

  circleAvatar({@required this.assetImage, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: responsive.width(radius, context),
      backgroundImage: AssetImage(assetImage),
    );
  }
}
