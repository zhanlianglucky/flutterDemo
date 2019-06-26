import 'dart:convert';//字符集格式转换

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//网络依赖

///网络 新增http依赖库 参考地址：https://pub.dev/packages/http#-readme-tab-
void main() => runApp(new MaterialApp(
  title: "test net",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("Show data from internet !"),
    ),
    body: new ContentWidget(),
  ),
));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class Weather {

}

class ContentState extends State<ContentWidget> {

  String data = "content";
  _getDataFromNet() async {
    String url = "http://www.weather.com.cn/data/cityinfo/101010100.html";
    var res = await http.get(url);
    setState(() {
      data = utf8.decode(res.body.codeUnits);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            color: Colors.red,
            padding: new EdgeInsets.all(12),
            child: new Text("拉取天气信息"),
              onPressed: (){
            _getDataFromNet();
          }),
          new Text(data),
        ],
      ),
    );
  }
}