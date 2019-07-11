import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/common/MaterialWidget.dart';
import 'package:flutter_demo/demo/common/MyBottomBar.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      title: "首页",
      body: Center(
        child: Text("home"),
      ),
      bottomNavigationBar: MyBottomBarContainer()
          .getBottomNavigationBar(_currentPageIndex, (i, b) {
        setState(() {
          _currentPageIndex = i;
        });
      }),
    );
  }
}
