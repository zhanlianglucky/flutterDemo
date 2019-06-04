import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(new MaterialApp(
      title: "test thread",
      theme: new ThemeData(primaryColor: Colors.red),
      home: new ThreadWidget(),
    ));

class ThreadWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ThreadState();
}

class ThreadState extends State<ThreadWidget> {
  String _remoteData = "click the bottom button get data!";
  int _clickTimes = 0;
  HttpClient httpClient = new HttpClient();

  _showRemoteData() {//展示数据
    return new Center(
      child: new Text(_remoteData),
    );
  }

  _onLoadData() async {//线程调用

    // ignore: close_sinks
    var request = await httpClient.getUrl(Uri.parse("http://www.weather.com.cn/data/cityinfo/101010100.html"));
    var response = await request.close();
    String res = "";
    if (response.statusCode == HttpStatus.ok){
//      res = response.connectionInfo.remoteAddress.host;
    var data = await response.transform(utf8.decoder).join();
    var jsonData = jsonDecode(data);
    res = jsonData;
    }
    setState(() {
      _remoteData = res;//字符串拼接
//      _remoteData = "remote data " + '$_clickTimes';//字符串拼接
//      _clickTimes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("use thread"),
      ),
      body: _showRemoteData(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _onLoadData();
        },
        child: new Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.blueGrey,
      ),
    );
  }
}
