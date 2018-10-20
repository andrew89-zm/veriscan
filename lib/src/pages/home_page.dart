import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_app/src/pages/login_page.dart';
import 'package:scan_app/src/utils/app_methods.dart';
import 'package:scan_app/src/utils/app_utils.dart';
import 'package:scan_app/src/utils/firebase_methods.dart';
import 'package:scan_app/src/views/home_body.dart';
import 'dart:io';
import 'package:scan_app/src/models/app_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext context;
  String acctName = '';
  String acctEmail = '';
  String acctPhotoURL = '';
  bool isLoggedIn;
  AppMethods appMethods = FirebaseMethods();

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoURL = await getStringDataLocally(key: photoURL);
    isLoggedIn = await getBoolDataLocally(key: loggedIN);
    print(await getStringDataLocally(key: userEmail));
    acctName == null ? acctName = "Guest User" : acctName;
    acctEmail == null ? acctEmail = "guestUser@email.com" : acctEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008000),
        title: Text('VeriScan',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w600,
                fontSize: 36.0)),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          HomeBody(),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(acctName),
              accountEmail: Text(acctEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("Order Notifications"),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => null));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("Order History"),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => null));
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("Profile Settings"),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => null));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => null));
              },
            ),
            Divider(),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("About Us"),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => null));
              },
              //
            ),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text(isLoggedIn == true ? "Logout" : "Login"),
              
              onTap: checkIfLoggedIn
            ),
          ],
        ),
      ),
    );
  }
  checkIfLoggedIn() async {
    if(isLoggedIn == false) {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => LoginPage()));
      return;  
      
    }
    bool response = await appMethods.logOutUser();
    if(response == true) getCurrentUser();
  }
}
