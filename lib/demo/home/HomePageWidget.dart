import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/common/MaterialWidget.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

/// D extends A with C ,D继承于A,由于单继承特性，这个时候D不能再使用extends关键字继承其他类，
/// 但是可以使用with关键字折叠其他类以实现代码重用。当属性和方法重复时，以当前类为准。
class HomePageState extends State<HomePageWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      title: "首页",
      body: TabBar(
        labelPadding: EdgeInsets.all(10),
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.add,color: Colors.red,),
            text: "首页",
          ),
        ],
        onTap: (i){
        },
        labelColor: Colors.red,
        controller: TabController(length: 1, vsync: this),
      ),
    );
  }
}
