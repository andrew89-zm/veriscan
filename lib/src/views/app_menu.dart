import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scan_app/src/pages/product_scan_page.dart';

class AppMenu extends StatefulWidget {
  
  @override
  _AppMenuState createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        buildCard(
            'PRODUCT SCANNER',
            'Use PRODUCT SCANNER to scan and verify the authenticity of the product you are buying.',
            Image(
              image: AssetImage('assets/img/qr-code.png'),
              height: 92.0,
              width: 92.0,
            ), () {
          Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ProductScanPage();
          }));
        }),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        buildCard(
            'TALKTIME LOADER',
            'Use talk loader to scan scratch card and loaded your talk time',
            Image(
              image: AssetImage('assets/img/mars.png'),
              height: 92.0,
              width: 92.0,
            ), () {
          Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return null;
          }));
        }),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        buildCard(
            'QR CODE EXPLORE',
            'Use QR CODE EXPLORE to scan qr codes get the contents',
            Image(
              image: AssetImage('assets/img/earth.png'),
              height: 92.0,
              width: 92.0,
            ), () {
          Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return null;
          }));
        }),
      ],
    );
  }

  GestureDetector buildCard(String title, String text,Image img, Function onTap) {
    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(title, style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18.0,
            fontWeight: FontWeight.w700
          ),),
          // Container(height: 10.0),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff)),
          Text(text),
          
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 140.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    final planetThumbnail = new Container(
        margin: new EdgeInsets.symmetric(vertical: 20.0),
        alignment: FractionalOffset.centerLeft,
        child: img);
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
