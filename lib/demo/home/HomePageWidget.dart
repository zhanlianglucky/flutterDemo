import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/MyAnimation.dart';
import 'package:flutter_demo/demo/common/MaterialWidget.dart';
import 'package:flutter_demo/demo/common/MyBottomBar.dart';
import 'package:flutter_demo/demo/home/HomeContentWidget.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  var _currentPageIndex = 0;

  @override
  void initState() {//初始化方法
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      title: MyBottomBarContainer.tabInfoList[_currentPageIndex],
      body: IndexedStack(//内容切换,不重绘
        children: <Widget>[
          HomeContentWidget(),
//          Center(child: Text(MyBottomBarContainer.tabInfoList[1]),),
          MyAnimation(),
          Center(child: Text(MyBottomBarContainer.tabInfoList[2]),),
          Center(child: Text(MyBottomBarContainer.tabInfoList[3]),),
          Center(child: Text(MyBottomBarContainer.tabInfoList[4]),),
        ],
        index: _currentPageIndex,
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


