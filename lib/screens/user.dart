import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/responsive.dart';
import 'package:manage_everything/widgets/custom_card.dart';

class User extends StatefulWidget {
  _MyUser createState() => _MyUser();
}

class _MyUser extends State<User>{
  Responsive responsive = new Responsive();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomCard(color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: CustomCard(color: Colors.amber,),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(color: Colors.amber,),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomCard(color: Colors.amber,),
                ),
                Expanded(
                  child: new CustomCard(color: Colors.amber,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}