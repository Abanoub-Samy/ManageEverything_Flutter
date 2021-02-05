import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/widgets/custom_card.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:provider/provider.dart';

class CustomButtonsForAddUserPage extends StatelessWidget {


  CustomButtonsForAddUserPage({
    this.selectButton,
    this.managerHasBeenPressed,
    this.assistantHasBeenPressed,
    this.childHasBeenPressed,
    this.usernamePasswordVisibility,
    this.classVisibility,
    this.listViewVisibility,
    this.image,
    this.onTap});

  int selectButton;
  bool managerHasBeenPressed = true;
  bool assistantHasBeenPressed = true;
  bool childHasBeenPressed = true;
  bool usernamePasswordVisibility = false;
  bool classVisibility = false;
  bool listViewVisibility = false;
  File image;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
    final constants = Provider.of<Constants>(context);
    return Container(
      height: responsive.height(12, context),
      width: responsive.width(100, context),
      child: CustomCard(
        color: constants.customCardColor,
        child: Row(
          children: [
            Expanded(
              child: CustomFlatButton(
                color: managerHasBeenPressed
                    ? constants.buttonColor
                    : constants.buttonChangeColor,
                onTap: onTap,
                text: constants.manager,
              ),
            ),
            Expanded(
              child: CustomFlatButton(
                color: assistantHasBeenPressed
                    ? constants.buttonColor
                    : constants.buttonChangeColor,
                onTap: onTap,
                text: constants.assistant,
              ),
            ),
            Expanded(
              child: CustomFlatButton(
                color: childHasBeenPressed
                    ? constants.buttonColor
                    : constants.buttonChangeColor,
                onTap: onTap,
                text: constants.child,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
