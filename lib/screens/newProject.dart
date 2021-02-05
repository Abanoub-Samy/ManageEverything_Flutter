import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_everything/const/constans.dart';
import 'package:manage_everything/const/responsive.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';
import 'package:provider/provider.dart';



class NewProject extends StatefulWidget {
  @override
  _NewProject createState() => _NewProject();
}

class _NewProject extends State<NewProject> {

  final _newProjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  AuthService _auth = new AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    final constants = Provider.of<Constants>(context);
    Responsive responsive = new Responsive();
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.newProjectString),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: responsive.height(10, context)),
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      Custom_Padding(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.playlist_add),
                            labelText: constants.newProjectString,
                          ),
                          autocorrect: false,
                          validator: (val) => val.toString().isEmpty
                              ? 'enter project name'
                              : null,
                          controller: _newProjectController,
                        ),
                      ),
                      Custom_Padding(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: constants.username,
                          ),
                          autocorrect: false,
                          validator: (val) =>
                              val.toString().isEmpty ? 'enter email' : null,
                          controller: _emailController,
                        ),
                      ),
                      Custom_Padding(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: constants.password,
                          ),
                          autocorrect: false,
                          validator: (val) =>
                              val.toString().isEmpty ? 'enter password' : null,
                          controller: _passwordController,
                          obscureText: true,
                        ),
                      ),
                      Custom_Padding(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: constants.confirmPassword,
                          ),
                          autocorrect: false,
                          validator: (val) => val.toString().isEmpty
                              ? 'enter confirm password'
                              : null,
                          obscureText: true,
                          controller: _confirmPasswordController,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Custom_Padding(
                              child: CustomFlatButton(
                                  color: constants.buttonColor,
                                  textColor: constants.buttonTextColor,
                                  onTap: (){
                                    createNewProject();
                                  },
                                  text: 'Create New Project'),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Text(error),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createNewProject() async {
    if (_passwordController.text.toString() ==
        _confirmPasswordController.text.toString()) {
      dynamic result = await _auth.registerAndCreateNewProject(
        _emailController.text.toString(),
        _passwordController.text.toString(),
        _newProjectController.text.toString(),
      );
      if (result == null) {
          error = 'email not valid';
          setState(() {

          });

      } else {
        print('every thing ok');
        //Navigator.pushNamed(context, 'wrapper');
      }
    } else {
      print('password not equal');
    }
  }
}
