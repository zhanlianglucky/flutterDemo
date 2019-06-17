import 'package:flutter/material.dart';

///随手练
void main() => runApp(new MaterialApp(
      title: "priactice click",
      home: new HomePageWidget(),
    ));

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  int _count = 0;

  void _updateCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("click to add count"),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new Row(
          children: <Widget>[
        new Text("count = $_count"),
            new FloatingActionButton(
              onPressed: _updateCount,
              child: new Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
