import 'package:flutter/material.dart';

/// 页面切换 和 返回首页
void main() => runApp(MaterialApp(
      title: "test navigator",
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("navigator test"),
        ),
        body: FirstPage(),
      ),
    ));

//通用主题
var theme = ThemeData(
  canvasColor: Colors.red,
  accentColor: Colors.green,
);

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TwoPage();
          }));
        },
        child: Text("To TwoPage"),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page two"),
      ),
      body: Center(child: RaisedButton(
          child: Text("To ThreePage"),
          onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ThreePage();
        }));
      })),
    );
  }
}

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page three"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).popUntil(//带标签的页面切换： navigator.popUntil(ModalRoute.withName('/main'));
                ModalRoute.withName(Navigator.defaultRouteName)); //返回首页
          },
          child: Text("Back to Home!"),
        ),
      ),
    );
  }
}
