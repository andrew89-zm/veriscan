import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:scan_app/src/pages/results_page.dart';
import 'package:scan_app/src/views/fancy_button.dart';


class ProductScanPage extends StatefulWidget {
  final double height;
  const ProductScanPage({Key key, this.height}) : super(key: key);

  @override
  _ProductScanPage createState() => _ProductScanPage();
}

class _ProductScanPage extends State<ProductScanPage> {
  final _overView =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining es";
  final _instructions =
      "Please press the Scan button below to scan the product you are buying";

  String result;

  Future<String> _scanQR() async {
    result = result;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(result: result,)));
    try {
      String qrResults = await BarcodeScanner.scan();
      result = qrResults;
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultsPage(
                    result: result,
                  )));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        result = "Permission to access the camera was denied";
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsPage(
                      result: result,
                    )));
      } else {
        result = "Unkown Error $e";
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsPage(
                      result: result,
                    )));
      }
    } on FormatException {
      result = "you pressed the back button before completing the qr scan";
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultsPage(
                    result: result,
                  )));
    } catch (e) {
      return result = "Unkown Error $e";
    }
  }

  Container _getBackground() {
    return Container(
      child: Image(
        image: AssetImage('assets/img/music.jpg'),
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getContent() {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          _buildCard(),
          Container(),
        ],
      ),
    ));
  }

  Container _buildCard() {
    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            "Product Scan".toUpperCase(),
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w800,
                fontFamily: 'Ubuntu',
                fontSize: 24.0),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: Colors.deepOrange,
          ),
          Container(height: 10.0),
          Text(_overView),
          Container(height: 10.0),
          Text(_instructions),
          Container(
            height: 60.0,
          ),
          ScanQR(onPressed: () {
            _scanQR();
          },)
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 400.0,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 160.0),
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

    return Container(
      child: Stack(
        children: <Widget>[
          planetCard,
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          children: <Widget>[
            BackButton(color: Colors.white),
            Text(
              'Product Scan',
              style: TextStyle(
                color: Colors.blueGrey
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.deepOrange,
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
}
