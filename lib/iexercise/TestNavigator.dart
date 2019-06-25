import 'package:flutter/material.dart';

///页面切换
void main() => runApp(new MaterialApp(
      title: "test navigator",
      home: new ScreenOne(),
    ));

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen One"),
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("click"),
            onPressed: () {
              Navigator.push(//打开第二页
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SecondScreen()));
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("click"),
            onPressed: () {
              Navigator.pop(context);//关闭当前视图页
            }),
      ),
    );
  }
}
