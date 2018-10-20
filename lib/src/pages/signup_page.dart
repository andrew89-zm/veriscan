// import 'package:flutter/material.dart';
// import 'package:scan_app/src/models/app_data.dart';
// import 'package:scan_app/src/utils/app_methods.dart';
// import 'package:scan_app/src/utils/app_utils.dart';
// import 'package:scan_app/src/utils/firebase_methods.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {

//   TextEditingController fullName = TextEditingController();
//   TextEditingController phoneNumber = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController re_password = TextEditingController();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   BuildContext context;
//   AppMethods appMethods = FirebaseMethods();

//   @override
//   Widget build(BuildContext context) {
//     this.context = context;
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         title: Text('Sign Up'),
//         centerTitle: false,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 30.0,
//             ),
//             appTextField(
//               isPassword: false,
//               sidePadding: 18.0,
//               textHint: 'Full Name',
//               textIcon: Icons.person,
//               controller: fullName
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             appTextField(
//               textType: TextInputType.number,
//               isPassword: false,
//               sidePadding: 18.0,
//               textHint: 'Phone Number',
//               textIcon: Icons.phone,
//               controller: phoneNumber
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             appTextField(
//               isPassword: false,
//               sidePadding: 18.0,
//               textHint: 'Email Address',
//               textIcon: Icons.email,
//               controller: email
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             appTextField(
//               isPassword: true,
//               sidePadding: 18.0,
//               textHint: 'Password',
//               textIcon: Icons.lock,
//               controller: password
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             appTextField(
//               isPassword: true,
//               sidePadding: 18.0,
//               textHint: 'Re-Password',
//               textIcon: Icons.lock,
//               controller: re_password
//             ),
//             appButton(
//               onBtnClicked: verifyDetails,
//               btnPadding: 18.0, 
//               btnTextTitle: 'Create Account', 
//               btnColor: Theme.of(context).primaryColor,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//   verifyDetails() async {
//     if (fullName.text == "") {
//       showSnackBar("Full name cannot be empty", scaffoldKey);
//       return;
//     }

//     if (phoneNumber.text == "") {
//       showSnackBar("Phone cannot be empty", scaffoldKey);
//       return;
//     }

//     if (email.text == "") {
//       showSnackBar("Email cannot be empty", scaffoldKey);
//       return;
//     }

//     if (password.text == "") {
//       showSnackBar("Password cannot be empty", scaffoldKey);
//       return;
//     }

//     if (re_password.text == "") {
//       showSnackBar("Re-Password cannot be empty", scaffoldKey);
//       return;
//     }

//     if (password.text != re_password.text) {
//       showSnackBar("Passwords don't match", scaffoldKey);
//       return;
//     }

//     displayProgressDialog(context);
//     String response = await appMethods.createUser(
//       fullName: fullName.text, 
//       phone: phoneNumber.text,
//       email: email.text.toLowerCase(), 
//       password: password.text.toLowerCase());
    
//     if(response == successful) {
//       closeProgressDialog(context);
//       Navigator.of(context).pop();
//       Navigator.of(context).pop();
//     } else {
//       closeProgressDialog(context);
//       showSnackBar(response, scaffoldKey);
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:scan_app/src/models/app_data.dart';
import 'package:scan_app/src/pages/login_page.dart';
import 'package:scan_app/src/utils/app_methods.dart';
import 'package:scan_app/src/utils/app_utils.dart';
import 'package:scan_app/src/utils/firebase_methods.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text("Sign Up"),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Full Name",
                textIcon: Icons.person,
                controller: fullname),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Phone Number",
                textIcon: Icons.phone,
                textType: TextInputType.number,
                controller: phoneNumber),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Email Address",
                textIcon: Icons.email,
                controller: email),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Password",
                textIcon: Icons.lock,
                controller: password),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Re-Password",
                textIcon: Icons.lock,
                controller: re_password),
            appButton(
                btnTextTitle: "Create Account",
                onBtnClicked: verifyDetails,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (fullname.text == "") {
      showSnackBar("Full name cannot be empty", scaffoldKey);
      return;
    }

    if (phoneNumber.text == "") {
      showSnackBar("Phone cannot be empty", scaffoldKey);
      return;
    }

    if (email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    if (re_password.text == "") {
      showSnackBar("Re-Password cannot be empty", scaffoldKey);
      return;
    }

    if (password.text != re_password.text) {
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethods.createUserAccount(
        fullName: fullname.text,
        phone: phoneNumber.text,
        email: email.text.toLowerCase(),
        password: password.text.toLowerCase());

    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => LoginPage())
      // );
      Navigator.of(context).pop();
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}