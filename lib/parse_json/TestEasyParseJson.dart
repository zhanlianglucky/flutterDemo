import 'dart:convert';//数据格式转换

import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/WeatherData.dart';//引入bean
import 'package:flutter_demo/http/HttpConfig.dart';
import 'package:http/http.dart' as http;

/// 方便的json 解析 对象嵌套
///注意初始化对象的时候 new 关键字可以省略
void main() => runApp(MaterialApp(
      title: "easy to parse json data",
      home: Scaffold(
        appBar: AppBar(
          title: Text("parse json data"),
          backgroundColor: Colors.red,
        ),
        body: ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContentState();
}

class ContentState extends State<ContentWidget> {
  String info = "";

  _getInfoFromNet() async {
    var res = await http.get(HttpConfig.cityWeatherUrl);
    setState(() {
      String content = utf8.decode(res.body.codeUnits);
      Map<String,dynamic> map = json.decode(content);
      WeatherData weatherData = WeatherData.fromJson(map);
      info = weatherData.weatherinfo.weather;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(info),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: new RaisedButton(
                  onPressed: () {
                    _getInfoFromNet();
                  },
                  child: Text("Click to get data from net!"),
                  padding: EdgeInsets.all(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
