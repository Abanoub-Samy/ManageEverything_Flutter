import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: constants.buttonColor,
          size: 50,
        ),
      ),
    );
  }

}