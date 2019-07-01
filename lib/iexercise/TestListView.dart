import 'package:flutter/material.dart';

///创建listview
void main() => runApp(new MaterialApp(
      title: "test listview",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("listview"),
        ),
        body: new ContentWidget(
          listData: new List<String>.generate(3, (i) => "item $i"),//创建数据
        ),
      ),
    ));

class ContentWidget extends StatelessWidget {
  ContentWidget({this.listData});
  final List<String> listData;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return new ListTile(
          title: new Text("${listData[index]}"),
          onTap: (){//点击事件
            print("${listData[index]} clicked");
          },
        );
      },
    );
  }
}
