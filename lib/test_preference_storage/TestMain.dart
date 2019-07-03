import 'package:flutter/material.dart';

import 'StorageState.dart';

///本地存储
void main() => runApp(new MaterialApp(
  title: "test local storage",
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("local storage"),
      backgroundColor: Colors.blue,
    ),
    body: new ContentWidget(),
  ),
));

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>new StorageState();
}