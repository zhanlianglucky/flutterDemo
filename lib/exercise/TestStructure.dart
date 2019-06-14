import 'package:flutter/material.dart';

///功能分离 计算和展示分离

void main() => runApp(new MaterialApp(
      title: "test structure",
      home: new HomePageWidget(),
    ));

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("change structure"),
        backgroundColor: Colors.blue[500],
      ),
      body: new CountWidget(),
    );
  }
}

class CountWidget extends StatefulWidget {
  createState() => new CountState();
}

class CountState extends State<CountWidget> {
  var _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CountOperatorWidget(onPress: _increment,), //计算
        new ShowCountWidget(count: _count), //展示
      ],
    );
  }
}

///计算类
class CountOperatorWidget extends StatelessWidget {
  final VoidCallback onPress;
  CountOperatorWidget({this.onPress});
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPress,
      child: new Icon(Icons.add),
    );
  }
}

///展示类
class ShowCountWidget extends StatelessWidget {
  ShowCountWidget({this.count});
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return new Text("count = $count");
  }
}
