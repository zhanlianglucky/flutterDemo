import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/common/MaterialWidget.dart';

///首页
class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

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
