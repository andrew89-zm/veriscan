import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({Key key, this.result}) : super(key: key);
  final String result;

  @override
  _ResultsPage createState() => _ResultsPage();
}

class _ResultsPage extends State<ResultsPage> {
  _ResultsPage({Key key, this.qrResult});

  final String qrResult;

  @override
  Widget build(BuildContext context) {

    _imageLoading() {
      if (qrResult != null) {
        return Image(
          image: AssetImage('assets/img/moon.png'),
          fit: BoxFit.cover,
        );
      } else {
        return Image(
          image: AssetImage('assets/img/earth.png'),
          fit: BoxFit.cover,
        );
      }
    }

    _productVisit() {
      if (qrResult != null) {
        return IconButton(
          icon: Icon(
            Icons.http,
            color: Colors.white,
          ),
          onPressed: () {},
        );
      } else {
        return IconButton(
          icon: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          onPressed: () {},
        );
      }
    }

    _productInfo() async {
      if (qrResult != null) {
        return Text(
          "The product you scanned is a genuine product, this means that"
          " the product you bought is from the original company that manufactures"
          " the actual product",
          style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Ubuntu')
        );
      } else {
        return Text(
          "The product you scanned is a Fake product, Fake products can cause this means that"
          " the product you bought is from the original company that manufactures"
          " the actual product",
          style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Ubuntu')
        );
      }
    }

    
    _productResultText() {
      if (qrResult != null) {
        return Text(
          "The product you scanned is a genuine product, this means that"
          " the product you bought is from the original company that manufactures"
          " the actual product",
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontFamily: 'Ubuntu'),
        );
      } else {
        return Text(
          "The product you scanned is a Fake product, Fake products can cause this means that"
          " the product you bought is from the original company that manufactures"
          " the product you bought is from the original company that manufactures"
          " the product you bought is from the original company that manufactures"
          " the actual product",
          style: TextStyle(
              color: Colors.blueGrey,fontWeight: FontWeight.w700, fontSize: 16.0, fontFamily: 'Ubuntu'),
        );
      }
    }

    _productInfoText() {
      if (qrResult != null) {
        return Text(
          'Genuine Product',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontFamily: 'Ubuntu'),
        );
      } else {
        return Text(
          'Possible Fake Product',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontFamily: 'Ubuntu'),
        );
      }
    }

    _detailsBackGroundColor() {
      if (qrResult != null) {
        return Color(0xFF008000);
      } else {
        return Color(0xFFFF0000);
      }
    }

    
    Widget _buildDetailsCard() {
      return Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Company:'),
                  Text('Muti Ent')
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Company:'),
                  Text('Muti Ent')
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Company:'),
                  Text('Muti Ent')
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Company:'),
                  Text('Muti Ent')
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: _detailsBackGroundColor(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 4.0,
              backgroundColor: Colors.blueGrey,
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              actions: <Widget>[_productVisit()],
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: _productInfoText(),
                  background: _imageLoading()),
            ),
          ];
        },
        
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    _productResultText(),
                  ],
                ),
              ),
            ),
            _buildDetailsCard()
          ],
        ),
      ),
    );
  }
}
