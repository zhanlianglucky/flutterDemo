import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  final DataColumnSortCallback callback;//回调
  MyTabBar({this.callback});
  @override
  State<StatefulWidget> createState() => MyTabBarState();
}
/// D extends A with C ,D继承于A,由于单继承特性，这个时候D不能再使用extends关键字继承其他类，
/// 但是可以使用with关键字折叠其他类以实现代码重用。当属性和方法重复时，以当前类为准。
/// 组装tabbar
class MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  final Color tabColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.all(4),
      tabs: <Widget>[
        Tab(
          icon: Icon(
            Icons.home,
            color: tabColor,
          ),
          text: "首页",
        ),
        Tab(
          icon: Icon(
            Icons.menu,
            color: tabColor,
          ),
          text: "分类",
        ),
        Tab(
          icon: Icon(
            Icons.message,
            color: tabColor,
          ),
          text: "聊天",
        ),
        Tab(
          icon: Icon(
            Icons.shopping_cart,
            color: tabColor,
//              size: 18,//图标大小
          ),
          text: "购物车",
        ),
        Tab(
          icon: Icon(
            Icons.person,
            color: tabColor,
          ),
          text: "我的",
        ),
      ],
      onTap: (i) {
        widget.callback(i,false);
      },
//        indicatorColor: Colors.transparent,//隐藏底部指示线
      labelColor: tabColor,
//        unselectedLabelColor: Colors.lightBlueAccent,
      labelStyle: TextStyle(fontSize: 12),
      controller: TabController(length: 5, vsync: this),
    );
  }
}