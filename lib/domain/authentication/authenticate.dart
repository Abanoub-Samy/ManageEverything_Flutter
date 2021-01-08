import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manage_everything/screens/loading.dart';
import 'package:manage_everything/services/auth.dart';
import 'package:manage_everything/widgets/custom_flat_button.dart';
import 'package:manage_everything/widgets/padding_text_field.dart';
import '../../const/constans.dart';
import '../../const/responsive.dart';

final AuthService _auth = new AuthService();
String error = '';
bool loading = false;

class Authenticate extends StatefulWidget {
  _Authenticate createState() => _Authenticate();
}
class _Authenticate extends State<Authenticate> {
  final _formKey1 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive();
    double width = (MediaQuery.of(context).size.width) / 100;
    double height = (MediaQuery.of(context).size.height) / 100;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Authenticate'),
              centerTitle: true,
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: (String choice) {
                    if (choice == Constans.newProjectString) {
                      Navigator.pushNamed(context, 'New Project');
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return Constans.newProject.map((String choice) {
                      return PopupMenuItem<String>(
                          value: choice, child: Text(choice));
                    }).toList();
                  },
                ),
              ],
            ),
            body: Container(
              child: Column(
                children: [
                  Form(
                    key: _formKey1,
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: responsive.height(10, context)),
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
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter email'
                                    : null,
                                controller: emailController,
                              ),
                            ),
                            Custom_Padding(
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                                validator: (val) => val.toString().isEmpty
                                    ? 'enter password'
                                    : null,
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
                                        onTap: signIn,
                                        text: 'sign in'),
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

  void signIn() async {
    if (_formKey1.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());
      if (result == null) {
        print('error signing in ');
        setState(() {
          loading = false;
        });
      } else {
        print('every thing ok ');
      }
    }
  }
}
