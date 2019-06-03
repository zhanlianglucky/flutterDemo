import 'package:flutter/material.dart';

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
  String _remoteData = "local data!";
  int _clickTimes = 0;

  _showRemoteData() {//展示数据
    return new Center(
      child: new Text(_remoteData),
    );
  }

  _onLoadData() async {//线程调用
    setState(() {
      _remoteData = "remote data " + '$_clickTimes';//字符串拼接
      _clickTimes++;
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
