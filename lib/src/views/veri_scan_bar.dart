import 'package:flutter/material.dart';

class VeriScanBar extends StatelessWidget {
  final double height;

  const VeriScanBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/img/music.jpg',
                fit: BoxFit.cover,
                ),

            )
          ],
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            "Product Scanner",
            style: TextStyle(fontFamily: 'ubuntu', fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}