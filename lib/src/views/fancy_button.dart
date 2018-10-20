import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ScanQR extends StatelessWidget {
  ScanQR({@required this.onPressed, result}); 
  final GestureTapCallback onPressed;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            fillColor: Colors.deepOrange,
            splashColor: Colors.orange,
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 24.0
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.camera_alt, color: Colors.amber,),
                  Expanded(child: SizedBox(),),
                  Text('SCAN PRODUCT', style: TextStyle(
                    fontFamily: 'Ubuntu', 
                    color: Colors.white, 
                    fontSize: 24.0, 
                    fontWeight: FontWeight.w700),)
                ],
              )
            ),
            onPressed: onPressed,
            shape: const StadiumBorder(),
          ),
        ],
      ),
    );
  }
}