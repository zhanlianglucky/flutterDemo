import 'dart:convert';//字符集格式转换

import 'package:flutter/material.dart';
import 'package:flutter_demo/http/HttpConfig.dart';
import 'package:http/http.dart' as http;//网络依赖

///网络+json数据解析   新增http依赖库 参考地址：https://pub.dev/packages/http#-readme-tab-
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


class WeatherInfo {
  String city,cityid,temp1,temp2,weather,ptime;
  WeatherInfo({this.city,this.cityid,this.temp1,this.temp2,this.weather,this.ptime});
  factory WeatherInfo.formJson(Map<String,dynamic> map){
    return new WeatherInfo(
      city: map['city'],
        cityid: map['cityid'],
      temp1: map['temp1'],
      temp2: map['temp2'],
      weather: map['weather'],
      ptime: map['ptime'],
    );
  }

}

class ContentState extends State<ContentWidget> {

  String data = "content";
  WeatherInfo weatherInfo;
  _getDataFromNet() async {
    String url = HttpConfig.cityWeatherUrl;
    var res = await http.get(url,headers: {"":""});//添加头信息
    setState(() {
      data = utf8.decode(res.body.codeUnits);
      var js = json.decode(data);
      print("${js['weatherinfo']}");//去掉最外层
      weatherInfo = new WeatherInfo.formJson(js["weatherinfo"]);//解析数据
    });
  }
  _getTestInfo() {
    String str = data;
    if (weatherInfo != null){
      str = "${weatherInfo.city} ${weatherInfo.cityid} \n ${weatherInfo.weather} \n ${weatherInfo.temp1} \n ${weatherInfo.temp2} \n ${weatherInfo.ptime} \n";
    }
    return str;
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
          new Text(_getTestInfo()),
        ],
      ),
    );
  }
}