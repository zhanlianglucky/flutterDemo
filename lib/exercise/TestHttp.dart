import 'dart:convert';//数据转换库

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//网络请求库

///网络请求
void main()=>runApp(new MaterialApp(
  title: "test http",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("http"),
      backgroundColor: Colors.red,
    ),
    body: new ContentWidget(),
  ),
));

class Weather {
  String city,cityid,temp1,temp2,weather,ptime;
  Weather({this.city,this.cityid,this.temp1,this.temp2,this.weather,this.ptime});

  factory Weather.formJson(Map<String,dynamic> map) {
    return new Weather(city: map['city'],cityid: map['cityid'],temp1: map['temp1'],temp2: map['temp2'],weather: map['weather'],ptime: map['ptime']);
  }
}


class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<StatefulWidget>{
  String url = "http://www.weather.com.cn/data/cityinfo/101010100.html";
  Weather weather;

  _getInfoFromNet() async {
    var response = await http.get(url,headers: {"":""});
    setState(() {
      var data = utf8.decode(response.body.codeUnits);
      var js =json.decode(data);
      weather = new Weather.formJson(js['weatherinfo']);
    });
  }

  _getShowInfo() {
    String info = "";
    if (weather != null){
      info = "${weather.city} ${weather.cityid} \n ${weather.weather} \n ${weather.temp1} \n ${weather.temp2} \n ${weather.ptime} \n";
    }
    return info;
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
            _getInfoFromNet();
          },child: new Text("查询天气信息"),),
          new Text(_getShowInfo())
        ],
      ),
    );
  }
}
