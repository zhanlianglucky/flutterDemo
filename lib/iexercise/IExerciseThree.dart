import 'package:flutter/material.dart';


///切换文字功能
void main()=>runApp(new MainPage());

///主页
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "switch text",
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      home: new HomePageWidget(),
    );
  }
}

///首页
class HomePageWidget extends StatefulWidget{
  createState() => new HomePageState();
}

///首页状态
class HomePageState extends State<StatefulWidget>{
  String _text = "defalut text";

  void _updateText(){//更新文字
    setState(() {//固定格式
      _text = "text after click floatting button !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test switch text!"),
      ),
      body: new Center(
        child: new Text(_text),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,//点击事件
        tooltip: "click to switch text",
        child: new Icon(Icons.update),
      ),
    );
  }

}

