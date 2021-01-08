import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manage_everything/const/constans.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: Constans.Button_color,
          size: 50,
        ),
      ),
    );
  }

}