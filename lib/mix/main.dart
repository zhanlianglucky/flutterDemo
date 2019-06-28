import 'package:flutter/material.dart';

import 'HomePageWidget.dart';

/// 测试分目录开发
void main()=>runApp(new MaterialApp(
  title: "test mix",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("mix test"),
      backgroundColor: Colors.blue[900],
    ),
    body: new HomePageWidget(),
  ),
));