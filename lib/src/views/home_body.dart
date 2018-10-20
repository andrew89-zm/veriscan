import 'package:flutter/material.dart';
import 'package:scan_app/src/views/app_menu.dart';


class HomeBody extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: Color(0xFF008000),
        child: AppMenu()
      ),
    );
  }
}

