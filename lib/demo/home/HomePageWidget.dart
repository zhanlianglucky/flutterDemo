import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/widget/MaterialWidget.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      title: "首页",
      body: Center(
        child: Text("hi demo"),
      ),
    );
  }
}
