import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/animation/MyAnimation1.dart';
import 'package:flutter_demo/demo/animation/MyAnimation3.dart';
import 'package:flutter_demo/demo/animation/MyAnimation4.dart';
import 'package:flutter_demo/demo/common/MaterialWidget.dart';
import 'package:flutter_demo/demo/common/MyBottomBar.dart';
import 'package:flutter_demo/demo/home/HomeContentWidget.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> with SingleTickerProviderStateMixin {
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
          HomeContentWidget(),//第一页
//          Center(child: Text(MyBottomBarContainer.tabInfoList[1]),),
          Padding( //第二页
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                MyAnimation(),
//                MAnimationWidget(),
                Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                MyAnimation3(),
                Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                MyAnimation4(singleTickerProviderStateMixin: this,),
              ],
            ),
          ),
          Center(child: Text(MyBottomBarContainer.tabInfoList[2]),),//第三页
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


