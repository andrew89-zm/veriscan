import 'package:flutter/material.dart';
import 'package:scan_app/src/models/app_data.dart';
import 'package:scan_app/src/pages/signup_page.dart';
import 'package:scan_app/src/utils/app_utils.dart';
import 'package:scan_app/src/utils/app_methods.dart';
import 'package:scan_app/src/utils/firebase_methods.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey =  GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Email Address',
              textIcon: Icons.email,
              controller: email
            ),
            SizedBox(
              height: 30.0,
            ),
            appTextField(
              isPassword: true,
              sidePadding: 18.0,
              textHint: 'Password',
              textIcon: Icons.lock,
              controller: password
            ),
            appButton(
              onBtnClicked: verifyLoggin,
              btnPadding: 18.0, 
              btnTextTitle: 'Login', 
              btnColor: Theme.of(context).primaryColor,
              ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpPage())
                );
              },
              child: Text(
                'Not Registered? Sign Up here',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
  verifyLoggin() async {
    if (email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }
    if (password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethods.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
        
    if (response !=null && response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
      print(response);
    }
  }
}