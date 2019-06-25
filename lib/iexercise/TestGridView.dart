import 'package:flutter/material.dart';

///表格
void main() => runApp(new MaterialApp(
  title: "test gridView",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("GridView"),
      backgroundColor: Colors.red,
    ),
    body: new GridViewWidget(),
  ),
));


class GridViewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      scrollDirection: Axis.vertical,//竖排
      crossAxisCount: 2,//2列
      children: new List.generate(
          100, (index){
        return new Container(
          margin: new EdgeInsets.all(10),
          decoration: new BoxDecoration(//背景
            color: Colors.blue[100],
            borderRadius: new BorderRadius.circular(5),
            border: new Border.all(color: Colors.red),
          ),
          child: new Center(//内容
            child: new Text("item $index"),
          ),
        );
      }),
    );
  }
}