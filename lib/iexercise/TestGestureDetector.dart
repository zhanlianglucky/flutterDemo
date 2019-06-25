import 'package:flutter/material.dart';

///手势事件
void main() => runApp(
  new MaterialApp(
    title: "test gestureDetector",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("GestureDetector"),
        backgroundColor: Colors.red,
      ),
      body:new Center(
        child: new Row(//水平布局
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ClickButton(),
            new MyButton(),
          ],
        ),
      ),
    ),
  )
);

///创建button
class ClickButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){//点击事件
        SnackBar sb = new SnackBar(content: new Text("snackBar"));
        Scaffold.of(context).showSnackBar(sb);
      },
      child:new Container(
        padding: new EdgeInsets.all(12),
        decoration: new BoxDecoration(//背景
            borderRadius: new BorderRadius.circular(8),
            color: Colors.red
        ),
        child: new Text("showSnackBar"),//按钮文字
      ),
    );
  }
}

///加上水波纹的button
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell Wraps our custom flat button Widget
    return new InkWell(
      // When the user taps the button, show a snackbar
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Tap'),
        ));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Text('Flat Button'),
      ),
    );
  }
}