import 'package:flutter/material.dart';

import 'BatteryState.dart';

///与Android原生交互
void main() => runApp(new MaterialApp(
  title: "battery from android",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("current battery"),
      backgroundColor: Colors.blue,
    ),
    body: new ContentWidget(),
  ),
));

///内容
class ContentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>new BatteryState();
}