import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/WeatherData.dart'; //引入数据bean
import 'package:http/http.dart' as http;

import 'HttpConfig.dart';

///http
void main() => runApp(MaterialApp(
      title: "test http",
      home: Scaffold(
        appBar: AppBar(
          title: Text("BeiJing's weather today!"),
          backgroundColor: Colors.blue,
        ),
        body: ContentWidget(),
      ),
    ));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContentState();
}

class ContentState extends State<ContentWidget> {
  String weather = "";

  _updateWeather() async {
    var res = await http.get(HttpConfig.cityWeatherUrl);
    String info = utf8.decode(res.body.codeUnits);
    WeatherData weatherData = WeatherData.fromJson(json.decode(info));
    setState(() {
      weather = weatherData.weatherinfo.weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //子控件居中显示
          children: <Widget>[
            Text(
              weather,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                wordSpacing: 8, //对汉字无效
                letterSpacing: 4,
              ),
            ),
            Padding(
              //插入padding控件
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
            ),
            RaisedButton(
              onPressed: () {
                _updateWeather();
              },
              child: Text(
                "Click to check weather!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  wordSpacing: 6, //单词间距,对汉字无效
                  letterSpacing: 2, //字母间距
                ),
              ),
              color: Colors.deepOrange,
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
