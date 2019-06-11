import 'package:flutter/material.dart';

/// 布局

void main() => runApp(new MaterialApp(
      title: "test layout",
      home: new HomePage(),
    ));

///主页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      child: new Column(
        //垂直方向的线性布局
        children: <Widget>[
          new TitleBar(
            title: new Text("test cloumn container layouts!"),
          ),
          new Expanded(
              child: new Center(
            child: new Text("content"),
          )),
          new BottomBar(
            title: new Text("bottom container"),
          )
        ],
      ),
    );
  }
}

//头部组件
class TitleBar extends StatelessWidget {
  final Widget title;
  TitleBar({this.title}); //构造函数

  @override
  Widget build(BuildContext context) {
    return new Container(
      // Container 可让您创建矩形视觉元素
      height: 48.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        // Row 是水平方向的线性布局（linear layout）
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: "Navigation menu",
              onPressed: null // null 会禁用 button
              ),
          new Expanded(
              // Expanded expands its child to fill the available space.
              child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "Search", onPressed: null)
        ],
      ),
    );
  }
}

///底部组件
class BottomBar extends StatelessWidget {
  final Widget title;
  BottomBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40,
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.update), onPressed: null),
          new Expanded(child: new Text(""), flex: 1,),//通过flex均分剩余空间
          new IconButton(icon: new Icon(Icons.title), onPressed: null),
          new Expanded(child: new Text(""),flex: 1,),
          new IconButton(icon: new Icon(Icons.print), onPressed: null),
          new Expanded(child: new Text(""),flex: 1,),
          new IconButton(icon: new Icon(Icons.style), onPressed: null),
          new Expanded(child: new Text(""),flex: 1,),
          new IconButton(icon: new Icon(Icons.transform), onPressed: null),
        ],
      ),
    );
  }
}
