import 'package:flutter/material.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';

import '../../constans.dart';
import '../../responsive.dart';

class Authenticate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
    final AuthService authService = new AuthService();
    double width = (MediaQuery.of(context).size.width) / 100;
    double height = (MediaQuery.of(context).size.height) / 100;
    final email=TextEditingController();
    final password=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticate'),
        centerTitle: true,
        //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
      ),
      body: Container(
      child: Column(
        children: [
          Form(
            child: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: responsive.height(10, context)),
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    Custom_Padding(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                        autocorrect: false,
                        controller: email,
                      ),
                    ),
                    Custom_Padding(
                      child: TextFormField(
                        // controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        autocorrect: false,
                        controller: password,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10 * width,
                                5 * height, 10 * width, 10 * height),
                            child: CustomFlatButton(
                                color: Constans.Button_color,
                                textColor: Constans.Button_text_color,
                                onTap: () async {
                                  dynamic result =
                                      await authService.signIn();
                                  if (result == null) {
                                    print('error signing in ');
                                  } else {
                                    print('every thing ok ');
                                    Navigator.pushNamed(context, 'admin');
                                  }
                                },
                                text: Constans.User),
                          ),
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
}
