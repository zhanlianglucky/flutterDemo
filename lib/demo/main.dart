import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/home/HomePageWidget.dart';
import 'package:flutter_demo/demo/home/SplashWiget.dart';

/// 入口
void main() => runApp(AppWidget());


class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<AppWidget>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashWidget(),routes: <String,WidgetBuilder>{
      "/home":(BuildContext context)=> HomePageWidget(),//首页
    },);
  }
}