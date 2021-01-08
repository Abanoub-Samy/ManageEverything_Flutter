import 'package:flutter/material.dart';
import 'package:manage_everything/models/churchModel.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';

class ListShow extends StatelessWidget{
  final ChurchModel churchModel ;
  ListShow({this.churchModel});

  @override
  Widget build(BuildContext context) {
    return Custom_Padding(
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          subtitle: Text(churchModel.churchName),
        ),
      ),
    );
  }

}