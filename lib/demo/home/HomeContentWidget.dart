import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/home/gridlist/GridListWidget.dart';

///首页内容
class HomeContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeContentState();
}

class HomeContentState extends State<HomeContentWidget> {
  int info = 0;
  @override
  Widget build(BuildContext context) {
    return GridListWidget();
  }
}