import 'package:flutter/material.dart';

class Responsive {
  double width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  double height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}
