import 'package:flutter/material.dart';

///通过点击切换展示的控件
void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "switch widget",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  bool _isShowText = true;

  _getChildWidget() {
    if (_isShowText) {
      return new Text("Show defalut text!");
    }
    return new MaterialButton(
      onPressed: () {
        _changeState();
      },
      child: new Text("Button"),
    );
  }

  _changeState() {
    setState(() {
      _isShowText = !_isShowText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test switch widget!"),
      ),
      body: _getChildWidget(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _changeState,
        tooltip: "click to change widget!",
        child: new Icon(Icons.update),
      ),
    );
  }
}
